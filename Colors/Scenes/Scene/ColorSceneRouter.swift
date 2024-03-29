//
//  ColorSceneRouter.swift
//  Colors
//
//  Created by Alexander Vorobyev on 28/08/2019.
//  Copyright (c) 2019 Utkonos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ColorSceneRoutingLogic {
//    func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol ColorSceneDataPassing: class {
    var dataStore: ColorSceneDataStore? { get }
}

class ColorSceneRouter: ColorSceneDataPassing {
    weak var viewController: ColorSceneViewController?
    var dataStore: ColorSceneDataStore?
}

// MARK: - ColorSceneRoutingLogic
extension ColorSceneRouter: ColorSceneRoutingLogic {
    
//    func routeToSomewhere(segue: UIStoryboardSegue?) {
//        let vc = Builder.build()
//        viewController?.show(vc, sender: nil)
//    }
    
}
