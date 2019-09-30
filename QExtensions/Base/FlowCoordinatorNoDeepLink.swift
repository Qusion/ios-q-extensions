//
//  FlowCoordinatorNoDeepLink.swift
//  QExtensions
//
//  Created by Tomas Holicky on 25/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

import Foundation

extension QBase {
    
    /// Empty class for QBase.FlowCoordinator with no deep link handling
    public enum NoDeepLink {}
    
    /// Base VC with no VM
    open class FlowCoordinatorNoDeepLink: QBase.FlowCoordinator<NoDeepLink> {}
}
