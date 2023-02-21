//
//  UIButton+Animations.swift
//  Calcumate
//
//  Created by Beavean on 23.08.2022.
//

import Foundation
import UIKit

extension UIButton {
    func bounce() {
        UIView.animate(withDuration: 0.05, delay: 0, options: [.curveEaseOut, .allowUserInteraction]) { [weak self] in
            self?.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        } completion: { _ in
            UIView.animate(withDuration: 0.02,
                           delay: 0,
                           options: [.curveEaseInOut, .allowUserInteraction]) { [weak self] in
                self?.transform = CGAffineTransform.identity
            } completion: { _ in
            }
        }
    }
}
