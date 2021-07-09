//
//  ViewControllerContract.swift
//  LearnVIPER
//
//  Created by zein rezky chandra on 09/07/21.
//

import Foundation

// MARK: Define interaction between View -> Presenter (View Input)
protocol ViewControllerPresenterProtocol: AnyObject {
    func navigateToDetailCatalogue()
    func fetchCatalogue()
    func viewDidLoad()
    func refreshView(model: ViewControllerModel)
}

// MARK: Define interaction between Presenter -> View (View Output)
protocol ViewControllerViewProtocol: AnyObject {
    func didSuccessfullyRequestCatalogue(model: ViewControllerModel)
    func showLoading()
    func hideLoading()
    func showError(message: String)
}

// MARK: Define interaction between Presenter -> Interactor (Interactor Input)
protocol ViewControllerInteractorInputProtocol: AnyObject {
    func fetchCatalogue()
}

// MARK: Define interaction between Interactor -> Presenter (Interactor Output)
protocol ViewControllerInteractorOutputProtocol: AnyObject {
    func requestDidSuccessGetCatalogueData(model: ViewControllerModel)
    func requestDidFailGetCatalogueData(message: String)
}

// MARK: Define interaction between Presenter -> Router (Router Input)
protocol ViewControllerRouterProtocol: AnyObject {
    func navigateToDetailCatalogue()
}
