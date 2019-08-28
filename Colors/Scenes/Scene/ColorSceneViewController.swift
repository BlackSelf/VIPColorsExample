//
//  ColorSceneViewController.swift
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

protocol ColorSceneDisplayLogic: class {
    func displayFetchingResult(viewModel: ColorScene.Fetching.ViewModel)
}

class ColorSceneViewController: UIViewController {
    var interactor: ColorSceneBusinessLogic?
    var router: (ColorSceneRoutingLogic & ColorSceneDataPassing)?
    lazy var customView = self.view as? ColorSceneView
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        fetchData()
    }
    
    override func loadView() {
        view = ColorSceneView()
    }
    
    deinit {
        print("ColorSceneViewController deinit")
    }
    
    // MARK: - Configuration
    
    private func configure() {
        
    }
    
    // MARK: - Work
    
    private func fetchData() {
        let request = ColorScene.Fetching.Request()
        interactor?.fetchData(request: request)
    }
    
}

// MARK: - ColorSceneDisplayLogic
extension ColorSceneViewController: ColorSceneDisplayLogic {
    
    func displayFetchingResult(viewModel: ColorScene.Fetching.ViewModel) {
        customView?.backgroundColor = viewModel.displayedColor.color
        title = viewModel.displayedColor.title
    }
    
}