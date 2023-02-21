//
//  EquationTableViewCell.swift
//  Calcumate
//
//  Created by Beavean on 23.08.2022.
//

import UIKit

final class EquationTableViewCell: UITableViewCell {
    @IBOutlet var leftSideLabel: UILabel!
    @IBOutlet var rightSideLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var tickView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        tickView.alpha = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func displayTick() {
        UIView.animate(withDuration: 0.25, delay: 0, options: []) { [weak self] in
            self?.tickView.alpha = 1
            self?.tickView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        } completion: { _ in
            UIView.animate(withDuration: 0.1, delay: 0, options: []) { [weak self] in
                self?.tickView.transform = CGAffineTransform.identity
            } completion: { _ in
            }
        }
    }
}
