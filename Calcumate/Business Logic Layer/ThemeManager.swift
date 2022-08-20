//
//  ThemeManager.swift
//  Calcumate
//
//  Created by Beavean on 20.08.2022.
//

import Foundation

class ThemeManager {
    
    //MARK: - Singleton
    
    static let shared = ThemeManager()
    
    //MARK: - Themes
    
    private var savedThemeIndex = 0
    private(set) var themes: [CalculatorTheme] = []
    private var savedTheme: CalculatorTheme?
    var currentTheme: CalculatorTheme {
        guard let savedTheme = savedTheme else { return themes.first ?? darkTheme }
        return savedTheme
    }
    
    //MARK: - Lifecycle
    
    init() {
        createArrayOfThemes()
    }
    
    private func createArrayOfThemes() {
        themes = [darkTheme, purpleTheme, bloodOrangeTheme, darkBlueTheme, electroTheme, lightBlueTheme, lightTheme, orangeTheme, pinkTheme, washedOutTheme]
    }
    
    //MARK: - Next Theme
    
    func moveToNextTheme() {
        savedThemeIndex = savedThemeIndex + 1
        if savedThemeIndex > themes.count - 1 {
            savedThemeIndex = 0
        }
        savedTheme = themes[savedThemeIndex]
    }
}
