//
//  ViewControllerInteractor.swift
//  LearnVIPER
//
//  Created by zein rezky chandra on 09/07/21.
//

import Foundation

class ViewControllerInteractor: ViewControllerInteractorInputProtocol {
    
    weak var output: ViewControllerInteractorOutputProtocol?
    
    private let service: CatalogueService
    
    init(service: CatalogueService) {
        self.service = service
    }
    
    func fetchCatalogue() {
        service.requestItemCatalogue { (response, error) in
            if let object = response {
                if object.data.count != 0 {
                    self.output?.requestDidSuccessGetCatalogueData(model: object)
                } else {
                    self.output?.requestDidFailGetCatalogueData(message: error!.localizedDescription)
                }
            }

        }
    }
}
