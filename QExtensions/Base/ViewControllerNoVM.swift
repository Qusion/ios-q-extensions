//
//  ViewControllerNoVM.swift
//  QExtensions
//
//  Created by Tomas Holicky on 26/09/2019.
//  Copyright © 2019 Qusion. All rights reserved.
//

extension QBase {
    
    /// Empty class for ViewControllerNoVM
    public struct NoViewModel {}
    
    /// QBase VC with no VM
    class ViewControllerNoVM: QBase.ViewController<NoViewModel> {
        
        public init() {
            super.init(viewModel: QBase.NoViewModel())
        }
        
        required public init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
