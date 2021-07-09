//
//  ViewControllerPresenter.swift
//  LearnVIPER
//
//  Created by zein rezky chandra on 09/07/21.
//

import Foundation

class ViewControllerPresenter: ViewControllerPresenterProtocol {
    
    // Presenter will need access to its View, Router, and Interactor. So we need to create an instance from each protocol
    
    weak var vc: ViewControllerViewProtocol?
    private let router: ViewControllerRouterProtocol?
    private let interactor: ViewControllerInteractorInputProtocol?
    
    init(interface: ViewControllerViewProtocol, interactor: ViewControllerInteractorInputProtocol, router: ViewControllerRouterProtocol) {
        self.vc = interface
        self.router = router
        self.interactor = interactor
    }
    
    // All works related to transition between navigation / view need to pass the task to the router
    func navigateToDetailCatalogue() {
        router?.navigateToDetailCatalogue()
    }
    
    // All works related to communication between mobile application and server application need to pass the task to interactor
    func fetchCatalogue() {
        interactor?.fetchCatalogue()
    }
    
    // All works related to what view should display, need to pass the task to view
    func viewDidLoad() {
        vc?.showLoading()
        fetchCatalogue()
    }
    
    func refreshView(model: ViewControllerModel) {
        vc?.hideLoading()
        vc?.didSuccessfullyRequestCatalogue(model: model)

    }
    
}

// MARK: We need a listener from interactor after done interact with server then send the response back to the presenter.

extension ViewControllerPresenter: ViewControllerInteractorOutputProtocol {
    func requestDidSuccessGetCatalogueData(model: ViewControllerModel) {
        refreshView(model: model)
    }
    
    func requestDidFailGetCatalogueData(message: String) {
        vc?.showError(message: message)
    }
}
