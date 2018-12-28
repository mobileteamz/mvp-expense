//
//  AddExpensePresenter.swift
//  sExpense
//
//  Created by Nacho on 10/19/18.
//  Copyright © 2018 Nacho. All rights reserved.

import UIKit

class AddExpensePresenter {
    
    // Private (internal) data and functions
    
    private var expenses = [Expense]()
    private var addExpenseService : AddExpenseService?
    
    init(addExpenseService : AddExpenseService) {
        self.addExpenseService = addExpenseService
    }
    
    // Public interface

    public func addExpense(_ newExpense : Expense) {
        expenses.append(newExpense)
        addExpenseService?.saveExpense(newExpense)
    }
    
    public func getExpenses() -> [Expense] {
        return expenses
    }
    
    public func removeExpense(expense : Expense) {
        //expenses.
    }
    
    public func calcTotalExpenses() -> Double {
        return 0
    }
    
    // Mas private methods (no me interesa testear éstos métodos)
    
    func isExpenseAlreadyPresent() -> Bool {
        return true
    }
}
