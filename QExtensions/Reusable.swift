//
//  Reusable.swift
//  QExtensions
//
//  Created by Tomas Holicky on 20/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import UIKit

protocol Reusable: class {}

extension Reusable {
    /// Reuse identifier
    public static var identifier: String {
        return String(describing: self)
    }
}

extension UIViewController: Reusable {}
extension UIView: Reusable {}

public protocol NibLoadable: class {
    
    static var nib: UINib { get }
}

extension NibLoadable where Self: UIViewController {
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

extension NibLoadable where Self: UIView {
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

extension UICollectionView {
    
    public func register<T: UICollectionViewCell>(_: T.Type) {
        self.register(T.classForCoder(), forCellWithReuseIdentifier: T.identifier)
    }
    
    public func register<T: UICollectionViewCell>(_: T.Type) where T: NibLoadable {
        self.register(T.nib, forCellWithReuseIdentifier: T.identifier)
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError(">>> Could not dequeue cell with identifier: \(T.identifier)")
        }
        
        return cell
    }
}

extension UITableView {
    
    public func register<T: UITableViewCell>(_: T.Type) {
        self.register(T.classForCoder(), forCellReuseIdentifier: T.identifier)
    }
    
    public func register<T: UITableViewCell>(_: T.Type) where T: NibLoadable {
        self.register(T.nib, forCellReuseIdentifier: T.identifier)
    }
}

