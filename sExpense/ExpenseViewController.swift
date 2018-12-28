//
//  ExpenseViewController.swift
//  sExpense
//
//  Created by Nacho on 10/31/18.
//  Copyright © 2018 Nacho. All rights reserved.
//

import UIKit
import SpinKit

class ExpenseViewController: UIViewController {
    var activityIndicator : UIActivityIndicatorView?
    
    func startLoadingSpinner() {
        if self.activityIndicator == nil {
            let activityIndicator = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
            //activityIndicator.center = loginButton.center
            self.view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            //loginButton.setTitle("", for: UIControlState.normal)
            self.activityIndicator = activityIndicator
        }
    }
    
    func stopLoadingSpinner() {
        if let activityIndicator = self.activityIndicator {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
            self.activityIndicator = nil
            //loginButton.setTitle("Login", for: UIControlState.normal)
        }
    }
    
    func showErrorWithMsg(_ text : String) {
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
