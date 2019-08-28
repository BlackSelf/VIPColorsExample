//
//  ColorListInteractor.swift
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

protocol ColorListBusinessLogic {
    func fetchData(request: ColorList.Fetching.Request)
}

protocol ColorListDataStore: class {

}

class ColorListInteractor: ColorListDataStore {
    var presenter: ColorListPresentationLogic?
    private lazy var worker = ColorListWorker()
}

// MARK: - ColorListBusinessLogic
extension ColorListInteractor: ColorListBusinessLogic {

    func fetchData(request: ColorList.Fetching.Request) {
        presenter?.presentLoadingStart(response: ColorList.StartLoading.Response())
        worker.fetchData { [weak self] result in
            switch result {
            case .success(let colors):
                self?.handleColors(colors)
            case .failure(let error):
                print(error.localizedDescription)
            }
            self?.presenter?.presentLoadingStop(response: ColorList.StopLoading.Response())
        }
    }
    
    // MARK: - Private
    
    private func handleColors(_ colors: [Color]) {
        let response = ColorList.Fetching.Response(colors: colors)
        presenter?.presentFetchingResult(response: response)
    }
    
    
}
