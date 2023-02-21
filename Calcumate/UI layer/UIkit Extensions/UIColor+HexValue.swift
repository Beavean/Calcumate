//
//  UIColor+HexValue.swift
//  Calcumate
//
//  Created by Beavean on 18.08.2022.
//

import UIKit

public extension UIColor {
    convenience init?(hex: String) {
        let red, green, blue: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    red = CGFloat((hexNumber & 0xFF0000) >> 16) / 255
                    green = CGFloat((hexNumber & 0x00FF00) >> 8) / 255
                    blue = CGFloat((hexNumber & 0x0000FF) >> 0) / 255

                    self.init(red: red, green: green, blue: blue, alpha: 1)
                    return
                }
            }
        }
        return nil
    }
}
