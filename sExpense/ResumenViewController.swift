//
//  ResumenViewController.swift
//  sExpense
//
//  Created by Nacho on 10/27/18.
//  Copyright © 2018 Nacho. All rights reserved.
//

import UIKit



class ResumenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddExpenseViewControllerDelegate {
    
    var myData = [Expense]()
    
    @IBOutlet weak var tableView: UITableView!
    
    // View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ResumenTableViewCell", bundle: nil), forCellReuseIdentifier: "ResumenTableViewCell")        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Agregar", style: .plain, target: self, action: #selector(didTapAgregar))
    }
    
    @objc func didTapAgregar(sender : Any){
        self.performSegue(withIdentifier: "segue_show_agregar", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_show_agregar" {
            let destinationViewController = segue.destination as! AddExpenseViewController
            destinationViewController.delegate = self
        }
    }
    
    // MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResumenTableViewCell") as! ResumenTableViewCell!
        let expense = myData[indexPath.row]
        cell?.configureCell(expense as! Expense)
        return cell!
    }
    
    // MARK: AddExpenseViewControllerDelegate
    
    func addExpense(_ expense : Expense){
        myData.append(expense)
        tableView.reloadData()
    }
    
    
    
    
    
    

}
