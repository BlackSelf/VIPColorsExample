//
//  SceneProtocol.swift
//  Colors
//
//  Created by Alexander Vorobyev on 28/08/2019.
//  Copyright © 2019 Utkonos. All rights reserved.
//

import Foundation
import UIKit

// MARK: - HUDDisplayLogic
protocol HUDDisplayLogic: class {
    var loadingIndicator: UIActivityIndicatorView { get set }
    func displayLoadingIndicator()
    func hideLoadingIndicator()
}

extension HUDDisplayLogic where Self: UIViewController {
    
    func configureHUD() {
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.center = view.center
        view.addSubview(loadingIndicator)
    }
    
    func displayLoadingIndicator() {
        loadingIndicator.startAnimating()
    }
    
    func hideLoadingIndicator() {
        loadingIndicator.stopAnimating()
    }
    
}

// MARK: - HUDPresentationLogic
protocol HUDPresentationLogic: class {
    var hudViewController: HUDDisplayLogic? { get }
    func presentLoadingIndicator()
    func hideLoadingIndicator()
}

extension HUDPresentationLogic {
    func presentLoadingIndicator() {
        hudViewController?.displayLoadingIndicator()
    }
    
    func hideLoadingIndicator() {
        hudViewController?.hideLoadingIndicator()
    }
}

// MARK: - ErrorMessagePresentationLogic
protocol ErrorMessagePresentationLogic: class {
    var errorViewController: ErrorMessageDisplayLogic? { get }
}

extension ErrorMessagePresentationLogic {
    func presentError(_ error: AppError) {
        errorViewController?.displayError(error)
    }
}

// MARK: - ErrorMessageDisplayLogic
protocol ErrorMessageDisplayLogic where Self: UIViewController {
}

extension ErrorMessageDisplayLogic {
    func displayError(_ error: AppError) {
        let vc = UIAlertController(title: "Error", message: error.message, preferredStyle: .alert)
        vc.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(vc, animated: true)
    }
}

// MARK: - AppError
struct AppError: Error {
    var message: String
}
