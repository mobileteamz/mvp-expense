//
//  AddExpenseViewController.swift
//  sExpense
//
//  Created by Nacho on 10/19/18.
//  Copyright © 2018 Nacho. All rights reserved.
//

import UIKit

protocol AddExpenseViewControllerDelegate {
    func addExpense(_ expense : Expense)
}

class AddExpenseViewController: ExpenseViewController {
    
    var addExpenseService : AddExpenseService?
    var addExpensePresenter : AddExpensePresenter?
    var delegate : AddExpenseViewControllerDelegate?
    
    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var descripcionText: UITextField!
    @IBOutlet weak var costoText: UITextField!
    
    // MARK: Initialization
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        addExpenseService = AddExpenseService()
        addExpensePresenter = AddExpensePresenter(addExpenseService:addExpenseService!)
    }
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Guardar", style: .plain, target: self, action: #selector(didTapGuardar))
    }
    
    @objc func didTapGuardar(sender : Any){
        guard checkIfTextBoxesValid() else {
            return
        }
        let costo = Double(costoText.text!)
        let newExpense = Expense.init(monto:costo!, detalle:descripcionText.text!, usuario: "")
        addExpensePresenter?.addExpense(newExpense)
        delegate?.addExpense(newExpense)
        
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func didPressElegir(_ sender: UIButton) {
        showAction()
    }
    
    // Helper functions
    
    func checkIfTextBoxesValid() -> Bool {
        if costoText.text?.count == 0 {
            showErrorWithMsg("Por favor, ingrese costo")
            return false
        }
        
        if descripcionText.text?.count == 0 {
            showErrorWithMsg("Por favor, ingrese descripcionText")
            return false
        }
        
        return true
    }
    
    private func showAction() {
        let actionsheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        for user in Session.shared.getUserFeed() {
            actionsheet.addAction(UIAlertAction(title: user, style: UIAlertActionStyle.default, handler: { (action) -> Void in
                self.userButton.setTitle(user, for: .normal)
            }))
        }
        present(actionsheet, animated: true, completion: nil)
    }
    


}
