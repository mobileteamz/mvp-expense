//
//  ResumenTableViewCell.swift
//  sExpense
//
//  Created by Nacho on 10/29/18.
//  Copyright © 2018 Nacho. All rights reserved.
//

import UIKit

class ResumenTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descipcionLabel: UILabel!
    @IBOutlet weak var costoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(_ expense : Expense) {
        descipcionLabel.text = expense.detalle
        costoLabel.text = "\(expense.monto)"
    }
    
}
