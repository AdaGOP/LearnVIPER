//
//  CatalogueService.swift
//  LearnVIPER
//
//  Created by zein rezky chandra on 09/07/21.
//

import Foundation

protocol CatalogueServiceProtocol {
    typealias CatalogueResponseModelCompletion = (ViewControllerModel?, Error?) -> Void
}

class CatalogueService: CatalogueServiceProtocol {
    
    func requestItemCatalogue(completion : @escaping (CatalogueResponseModelCompletion)){
        URLSession.shared.dataTask(with: URL(string: Constant.BASE_URL)!) { data, urlResponse, error in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                
                let responseData = try! jsonDecoder.decode(ViewControllerModel.self, from: data)
                
                completion(responseData, nil)
            }
            completion(nil, error)
        }.resume()
    }
}
