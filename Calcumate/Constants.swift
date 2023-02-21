//
//  Constants.swift
//  Calcumate
//
//  Created by Beavean on 25.08.2022.
//

import Foundation
import UIKit

// MARK: - UIImage

extension UIImage {
    enum Names {
        static let circleSliced = "CircleSliced"
        static let circle = "Circle"
    }
}

// MARK: - Display

extension DisplayView {
    enum Names {
        static let historyLogNotification = "Calcumate.DisplayView.displayHistory"
        static let pasteNumberNotification = "Calcumate.DisplayView.pasteNumber"
        static let pasteNumberKey = "PasteKey"
    }
}

// MARK: - LogViewController

extension LogViewController {
    enum Names {
        static let pasteEquationNotification = "Calcumate.LogView.pasteMathEquation"
        static let pasteNumberKey = "PasteKey"
    }
}

// MARK: - UIStoryboard

extension UIStoryboard {
    enum Names {
        static let mainStoryboard = "Main"
        static let logViewController = String(describing: LogViewController.self)
    }
}

// MARK: - ThemeManager

extension ThemeManager {
    enum Names {
        static let dataStoreThemeIndex = "Calcumate.ThemeManager.ThemeIndex"
    }
}

// MARK: - Calculator Engine

extension CalculatorEngine {
    enum Names {
        static let dataStore = "Calcumate.CalculatorEngine.PreviousResult"
    }
}
