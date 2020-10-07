//
//  UIViewController+Extensions.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    /// Hide keyboard when tapped on a UIVIewController if this is open
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.closeKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    /// Selector method called to hide keyboard when open
    ///
    /// - Parameter sender: il sender della gesture
    @objc private func closeKeyboard() {
        self.view.endEditing(true)
    }
    
    /// Show an alert with custom title and message with one cancel button that close the alert
    ///
    /// - Parameters:
    ///   - title: Alert title
    ///   - message: Alert message
    ///   - actionButtonTitle: Button title. Optional value if not present the default button title will be Ok
    func showCancelAlert(title: String, message: String, actionButtonTitle: String = "OK") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: actionButtonTitle, style: .cancel) { (done) in
            print("[Alert closed] - \(message)")
        }
        alert.addAction(okAction)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
