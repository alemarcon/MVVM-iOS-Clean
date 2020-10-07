//
//  Loadable.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import UIKit

protocol Loadable: LoadingViewDelegate {
    func showLoading(isFullScreen: Bool, isBackgroundVisible: Bool)
    func hideLoading(animate: Bool)
}

extension Loadable where Self: UIViewController {
    
    /// Show loadings view on full screen mode
    func showLoading(isFullScreen: Bool = true, isBackgroundVisible: Bool = true) {
        let nibViews = Bundle.main.loadNibNamed(LoadingView.NIB_NAME, owner: self, options: nil)
        if let loadingView = nibViews?.first as? LoadingView {
            
            if isFullScreen {
                let currentWindow: UIWindow? = UIApplication.shared.keyWindow
                currentWindow?.addSubview(loadingView)
                loadingView.frame = currentWindow!.bounds
            }
            else {
                view.addSubview(loadingView)
                loadingView.frame = view.frame
                loadingView.delegate = self
            }
            
            loadingView.activityIndicator.startAnimating()
            
        }
        
    }
    
    /// Hide all loader views previously added
    func hideLoading(animate: Bool = false) {
        let currentWindow: UIWindow? = UIApplication.shared.keyWindow
        currentWindow?.getSubviews(type: LoadingView.self)
            .forEach({ (loadingView) in
                
                if animate {
                    UIView.animate(
                        withDuration: 0.4,
                        delay: 0.0,
                        options: UIView.AnimationOptions.curveEaseIn,
                        animations: {
                            loadingView.alpha = 0.0
                    },
                        completion: {
                            (finished: Bool) -> Void in
                            loadingView.activityIndicator.stopAnimating()
                            loadingView.removeFromSuperview()
                    })
                }
                else {
                    loadingView.activityIndicator.stopAnimating()
                    loadingView.removeFromSuperview()
                }
                
            })
    }
    
    func onLoadingViewBackButton(){
        
    }
    
}
