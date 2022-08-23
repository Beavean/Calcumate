//
//  EquationTableViewCell.swift
//  Calcumate
//
//  Created by Beavean on 23.08.2022.
//

import UIKit

class EquationTableViewCell: UITableViewCell {
    
    @IBOutlet var leftSideLabel: UILabel!
    @IBOutlet var rightSideLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
