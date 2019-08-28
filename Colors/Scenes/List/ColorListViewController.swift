//
//  ColorListViewController.swift
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
import Reusable

protocol ColorListDisplayLogic: class {
    func displayFetchingResult(viewModel: ColorList.Fetching.ViewModel)
    func displayLoadingStart(viewModel: ColorList.StartLoading.ViewModel)
    func displayLoadingStop(viewModel: ColorList.StopLoading.ViewModel)
}

class ColorListViewController: UIViewController {
    var interactor: ColorListBusinessLogic?
    var router: (ColorListRoutingLogic & ColorListDataPassing)?
    lazy var customView = self.view as? ColorListView
    
    private var displayedColors: [ColorList.DisplayedColors] = []
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()        
        fetchData()
    }
    
    override func loadView() {
        view = ColorListView()
    }
    
    deinit {
        print("ColorListViewController deinit")
    }
    
    // MARK: - Configuration
    
    private func configure() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        customView?.tableView.delegate = self
        customView?.tableView.dataSource = self
    }
    
    // MARK: - Work
    
    private func fetchData() {
        let request = ColorList.Fetching.Request()
        interactor?.fetchData(request: request)
    }
    
    private func selectItem(at indexPath: IndexPath) {
        // по идее, нам нужно снова кидать request в interactor,
        // но сейчас это делать необязательно, так как у нас есть все нужное для перехода
        router?.routeToColorScene(id: displayedColors[indexPath.row].id)
    }
}

// MARK: - ColorListDisplayLogic
extension ColorListViewController: ColorListDisplayLogic {
    
    func displayFetchingResult(viewModel: ColorList.Fetching.ViewModel) {
        displayedColors = viewModel.displayedColors
        customView?.tableView.reloadData()
    }
    
    func displayLoadingStart(viewModel: ColorList.StartLoading.ViewModel) {
        customView?.activityIndicator.startAnimating()
    }
    
    func displayLoadingStop(viewModel: ColorList.StopLoading.ViewModel) {
        customView?.activityIndicator.stopAnimating()
    }
    
}

// MARK: - UITableViewDelegate
extension ColorListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectItem(at: indexPath)
    }
    
}

// MARK: - UITableViewDataSource
extension ColorListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedColors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as ColorTableViewCell
        cell.color = displayedColors[indexPath.row].color
        cell.title = displayedColors[indexPath.row].name
        return cell
    }
    
}