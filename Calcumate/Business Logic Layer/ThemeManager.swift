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
    
    //MARK: - Data Storage
    
    private var dataStore = DataStoreManager(key: ThemeManager.Names.dataStoreThemeIndex)
    
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
        restoreSavedTheme()
    }
    
    private func createArrayOfThemes() {
        themes = [darkTheme, purpleTheme, bloodOrangeTheme, darkBlueTheme, electroTheme, lightBlueTheme, lightTheme, orangeTheme, pinkTheme, washedOutTheme]
    }
    
    //MARK: - Save & Restore
    
    private func restoreSavedTheme() {
        guard let encodedTheme = dataStore.getValue() as? Data else {
            return
        }
        let decoder = JSONDecoder()
        if let previousTheme = try? decoder.decode(CalculatorTheme.self, from: encodedTheme) {
            savedTheme = previousTheme
        }
    }
    
    private func saveTheme(_ theme: CalculatorTheme) {
        let encoder = JSONEncoder()
        if let encodedTheme = try? encoder.encode(theme) {
            dataStore.set(encodedTheme)
        }
    }
    
    //MARK: - Next Theme
    
    func moveToNextTheme() {
        let currentThemeID = currentTheme.id
        let index = themes.firstIndex { calculatorTheme in
            calculatorTheme.id == currentThemeID
        }
        guard let indexOfExistingTheme = index else {
            if let firstTheme = themes.first {
                updateSystemWithTheme(firstTheme)
            }
            return
        }
        var newThemeIndex = indexOfExistingTheme + 1
        if newThemeIndex > themes.count - 1 {
            newThemeIndex = 0
        }
        guard let theme = themes[safe: newThemeIndex] else { return }
        savedTheme = theme
        saveTheme(theme)
    }
    
    private func updateSystemWithTheme(_ theme: CalculatorTheme) {
        savedTheme = theme
        saveTheme(theme)
    }
}
