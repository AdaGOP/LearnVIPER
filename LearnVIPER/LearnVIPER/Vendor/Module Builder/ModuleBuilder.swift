//
//  ModuleBuilder.swift
//  StellKey
//
//  Created by iOS dev on 14/07/21.
//

import UIKit

class ModuleBuilder {
    
    static let shared = ModuleBuilder()
    
    private init() {}
    
    func createCatalogueViewController() -> ViewController {
        let vc = ViewController.init(nibName: "ViewController", bundle: nil)
        let interactor = ViewControllerInteractor(service: CatalogueService())
        let router = ViewControllerRouter()
        let presenter = ViewControllerPresenter(interface: vc, interactor: interactor, router: router)
        vc.presenter = presenter
        interactor.output = presenter
        return vc
    }
        
}
