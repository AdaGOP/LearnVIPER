//
//  Extension+UIViewController.swift
//  LearnVIPER
//
//  Created by zein rezky chandra on 09/07/21.
//

import UIKit
import Foundation

extension UIViewController {
    
    private static let fullscreenActivityIndicatorViewTag = 88
    
    func showActivityIndicator(_ status: Bool, isFullScreen: Bool = false, isCenter: Bool = true) {
        var indicatorView = view.viewWithTag(UIViewController.fullscreenActivityIndicatorViewTag) as? UIActivityIndicatorView
        if status {
            if indicatorView == nil {
                indicatorView = UIActivityIndicatorView(style: .gray)
                indicatorView?.tag = UIViewController.fullscreenActivityIndicatorViewTag
            }
            indicatorView?.frame = isCenter ? UIScreen.main.bounds : CGRect(x: 0, y: 30, width: UIScreen.main.bounds.width, height: 44)
            indicatorView?.color = .black
            let bgAlpha = isFullScreen ? 1.0 : 0.66
            if isCenter {
                indicatorView?.backgroundColor = UIColor.softGray.withAlphaComponent(CGFloat(bgAlpha))
            }
            indicatorView?.startAnimating()
            indicatorView?.isHidden = false
            self.view.addSubview(indicatorView!)
            self.view.isUserInteractionEnabled = false
        } else {
            if indicatorView != nil {
                indicatorView?.stopAnimating()
                indicatorView?.alpha = 0
            }
            self.view.isUserInteractionEnabled = true
        }
    }
    
    func showToast(message: String) {
        ACAlert.show(message: message)
    }

}
