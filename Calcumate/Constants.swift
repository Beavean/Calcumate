//
//  Constants.swift
//  Calcumate
//
//  Created by Beavean on 25.08.2022.
//

import Foundation
import UIKit

//MARK: - UIImage

extension UIImage {
    struct Names {
        static let circleSliced = "CircleSliced"
        static let circle = "Circle"
    }
}

//MARK: - Display

extension DisplayView {
    struct Names {
        static let historyLogNotification = "Calcumate.DisplayView.displayHistory"
        static let pasteNumberNotification = "Calcumate.DisplayView.pasteNumber"
        static let pasteNumberKey = "PasteKey"
        
    }
}

//MARK: - LogViewController


extension LogViewController {
    struct Names {
        static let pasteEquationNotification = "Calcumate.LogView.pasteMathEquation"
        static let pasteNumberKey = "PasteKey"
    }
}

//MARK: - UIStoryboard

extension UIStoryboard {
    struct Names {
        static let mainStoryboard = "Main"
        static let logViewController = String(describing: LogViewController.self)
    }
}

//MARK: - ThemeManager

extension ThemeManager {
    struct Names {
        static let dataStoreThemeIndex = "Calcumate.ThemeManager.ThemeIndex"
    }
}

//MARK: - Calculator Engine

extension CalculatorEngine {
    struct Names {
        static let dataStore = "Calcumate.CalculatorEngine.PreviousResult"
    }
}
