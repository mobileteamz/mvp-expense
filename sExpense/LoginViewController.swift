//
//  LoginViewController.swift
//  sExpense
//
//  Created by Nacho on 10/29/18.
//  Copyright © 2018 Nacho. All rights reserved.
//

import UIKit

class LoginViewController: ExpenseViewController {
    
    var loginPresenter : LoginPresenter?
    var loginService : LoginService?
    
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginService = LoginService()
        loginPresenter = LoginPresenter.init(loginService: loginService!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didPressLogin(_ sender: UIButton) {
        guard checkIfTextBoxesValid() else {
            return
        }
        
        startLoadingSpinner()
        loginPresenter?.loginUserSaveSessionAndGetUserList(username: usernameTextfield.text!, password: passwordTextfield.text!, completion : { (error) in
            if error == nil {
                self.stopLoadingSpinner()
                self.performSegue(withIdentifier: "segue_show_resumen", sender: self)
            } else {
                self.showErrorWithMsg("Disculpe, no se pudieron validad sus credenciales")
            }
        })
    }
    
    func checkIfTextBoxesValid() -> Bool {
        guard usernameTextfield.text?.count != 0 else {
            showErrorWithMsg("Por favor, ingrese username")
            return false
        }
        
        guard passwordTextfield.text?.count != 0 else {
            showErrorWithMsg("Por favor, ingrese password")
            return false
        }
        
        return true
    }
    
}
