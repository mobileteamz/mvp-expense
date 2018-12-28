//
//  AddExpensePresenter.swift
//  sExpenseTests
//
//  Created by Nacho on 10/19/18.
//  Copyright © 2018 Nacho. All rights reserved.
//

import XCTest

class AddExpenseMockService : AddExpenseService {
    
}

class AddExpensePresenterTest : XCTestCase {
    
    var addExpensePresenter : AddExpensePresenter?
    var addExpenseMockService : AddExpenseService?
    
    override func setUp() {
        super.setUp()
        addExpenseMockService = AddExpenseMockService()
        addExpensePresenter = AddExpensePresenter(addExpenseService:addExpenseMockService!)
    }
    
    override func tearDown() {
        super.tearDown()
        
    }
    
    func testAddExpense() {
        // Given
        let expenseNuevoTest = Expense.init(monto: 99.99, detalle: "Expense de test", usuario: "")
        
        // When
        addExpensePresenter?.addExpense(expenseNuevoTest)
        
        // Verify
        let expenses = addExpensePresenter?.getExpenses()
        XCTAssert(expenses?.count==1, "AddExpensePresenter: Should have 1 expense")        
    }
    
//    func testDameTotalExpenses() {
//        // Given
//        let expenseNuevoTest1 = Expense.init(monto: 99.99, detalle: "Expense de test 1", usuario: "")
//        let expenseNuevoTest2 = Expense.init(monto: 199.99, detalle: "Expense de test 2", usuario: "")
//
//        // When
//        addExpensePresenter?.addExpense(expenseNuevoTest1)
//        addExpensePresenter?.addExpense(expenseNuevoTest2)
//
//        // Verify
//        let totalExpenses = addExpensePresenter?.calcTotalExpenses()
//        //XCTAssert(false, "AddExpensePresenter: Should have 1 expense")
//    }
    
}
