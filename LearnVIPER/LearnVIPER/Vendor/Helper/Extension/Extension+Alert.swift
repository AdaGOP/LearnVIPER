//
//  Extension+Alert.swift
//  LearnVIPER
//
//  Created by zein rezky chandra on 09/07/21.
//

import UIKit

class ACAlert: NSObject {
    static func show(message:String){
        
        ACAlert.showInformation(
            title: "Alert",
            message: message
        )
    }
    
    static func showInformation(
        title:String,
        message:String){
        
        ACAlert.showInformation(
            title: title,
            message: message,
            viewController: (UIApplication.shared.delegate?.window!!.rootViewController!)!)
    }
    
    static func show(
        message:String,
        viewController:UIViewController){
        
        ACAlert.showInformation(
            title: "Alert",
            message: message,
            viewController: viewController
        )
    }
    
    static func showInformation(
        title:String,
        message:String,
        viewController:UIViewController){
        
        let alertController = UIAlertController(
            title: title,
            message:message != "" ? message : "",
            preferredStyle: .alert
        )
        
        alertController.addAction(UIAlertAction(
            title: "Ok",
            style: .default,
            handler:nil))
        
        viewController.present(
            alertController,
            animated: true,
            completion: nil
        )
    }
}
