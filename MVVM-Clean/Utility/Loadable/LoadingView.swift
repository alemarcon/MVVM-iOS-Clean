//
//  LoadingView.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    static let NIB_NAME = "LoadingView"
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    weak var delegate: LoadingViewDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func onBackButtonAction() {
        delegate?.onLoadingViewBackButton()
    }
}


protocol LoadingViewDelegate: AnyObject {
    func onLoadingViewBackButton()
}
