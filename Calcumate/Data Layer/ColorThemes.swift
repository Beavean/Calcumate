//
//  ColorThemes.swift
//  Calcumate
//
//  Created by Beavean on 19.08.2022.
//
// swiftlint: disable type_body_length

import Foundation

extension ThemeManager {
    enum CalculatorThemes: CaseIterable {
        case bloodOrange
        case darkBlue
        case dark
        case electro
        case lightBlue
        case light
        case orange
        case pink
        case purple
        case washedOut
        case bumbleBee
        case futuristic
        case lipStick
        case strange
        case peach
        case pinkDots

        var theme: CalculatorTheme {
            switch self {
            case .bloodOrange:
                return CalculatorTheme(id: "1",
                                       backgroundColor: "#4A1D41",
                                       displayColor: "#FFFFFF",
                                       extraFunctionColor: "#9C3766",
                                       extraFunctionTitleColor: "#FFFFFF",
                                       operationColor: "#8D3362",
                                       operationTitleColor: "#FFFFFF",
                                       operationSelectedColor: "#AA0E67",
                                       operationTitleSelectedColor: "#ffffff",
                                       pinPadColor: "#C64661",
                                       pinPadTitleColor: "#FFFFFF",
                                       statusBarStyle: .light)
            case .darkBlue:
                return CalculatorTheme(id: "2",
                                       backgroundColor: "#1D1D1D",
                                       displayColor: "#727272",
                                       extraFunctionColor: "#323232",
                                       extraFunctionTitleColor: "#FFFFFF",
                                       operationColor: "#4566B6",
                                       operationTitleColor: "#FFFFFF",
                                       operationSelectedColor: "#4566B6",
                                       operationTitleSelectedColor: "#FFFFFF",
                                       pinPadColor: "#1D1D1D",
                                       pinPadTitleColor: "#767676",
                                       statusBarStyle: .light)
            case .dark:
                return CalculatorTheme(id: "3",
                                       backgroundColor: "#000000",
                                       displayColor: "#FFFFFF",
                                       extraFunctionColor: "#a6a6a6",
                                       extraFunctionTitleColor: "#000000",
                                       operationColor: "#ff9f0a",
                                       operationTitleColor: "#FFFFFF",
                                       operationSelectedColor: "#ffffff",
                                       operationTitleSelectedColor: "#ff9f0a",
                                       pinPadColor: "#333333",
                                       pinPadTitleColor: "#FFFFFF",
                                       statusBarStyle: .light)
            case .electro:
                return CalculatorTheme(id: "4",
                                       backgroundColor: "#0E0E41",
                                       displayColor: "#FFFFFF",
                                       extraFunctionColor: "#14145C",
                                       extraFunctionTitleColor: "#4BE6A9",
                                       operationColor: "#4BE6A9",
                                       operationTitleColor: "#14145C",
                                       operationSelectedColor: "#70729D",
                                       operationTitleSelectedColor: "#ffffff",
                                       pinPadColor: "#14145C",
                                       pinPadTitleColor: "#FFFFFF",
                                       statusBarStyle: .light)
            case .lightBlue:
                return CalculatorTheme(id: "5",
                                       backgroundColor: "#F8F8F8",
                                       displayColor: "#000000",
                                       extraFunctionColor: "#D6DEE5",
                                       extraFunctionTitleColor: "#00B4FF",
                                       operationColor: "#00B4FF",
                                       operationTitleColor: "#FFFFFF",
                                       operationSelectedColor: "#0265FF",
                                       operationTitleSelectedColor: "#ffffff",
                                       pinPadColor: "#EEEEEE",
                                       pinPadTitleColor: "#000000",
                                       statusBarStyle: .dark)
            case .light:
                return CalculatorTheme(id: "6",
                                       backgroundColor: "#F6F8F9",
                                       displayColor: "#000000",
                                       extraFunctionColor: "#E9F0F4",
                                       extraFunctionTitleColor: "#4BE6A9",
                                       operationColor: "#4BE6A9",
                                       operationTitleColor: "#14145C",
                                       operationSelectedColor: "#70729D",
                                       operationTitleSelectedColor: "#ffffff",
                                       pinPadColor: "#E9F0F4",
                                       pinPadTitleColor: "#000000",
                                       statusBarStyle: .dark)
            case .orange:
                return CalculatorTheme(id: "7",
                                       backgroundColor: "#DC6969",
                                       displayColor: "#FFFFFF",
                                       extraFunctionColor: "#D05353",
                                       extraFunctionTitleColor: "#FFFFFF",
                                       operationColor: "#CC4D4D",
                                       operationTitleColor: "#FFFFFF",
                                       operationSelectedColor: "#AB2F2F",
                                       operationTitleSelectedColor: "#ffffff",
                                       pinPadColor: "#C94848",
                                       pinPadTitleColor: "#FFFFFF",
                                       statusBarStyle: .light)
            case .pink:
                return CalculatorTheme(id: "8",
                                       backgroundColor: "#253C5B",
                                       displayColor: "#EBF0EF",
                                       extraFunctionColor: "#294666",
                                       extraFunctionTitleColor: "#EBF0EF",
                                       operationColor: "#FA569C",
                                       operationTitleColor: "#EBF0EF",
                                       operationSelectedColor: "#0265FF",
                                       operationTitleSelectedColor: "#ffffff",
                                       pinPadColor: "#16253A",
                                       pinPadTitleColor: "#EBF0EF",
                                       statusBarStyle: .light)
            case .purple:
                return CalculatorTheme(id: "9",
                                       backgroundColor: "#F4F5FA",
                                       displayColor: "#1D1D1D",
                                       extraFunctionColor: "#F4F5FA",
                                       extraFunctionTitleColor: "#7550FE",
                                       operationColor: "#7550FE",
                                       operationTitleColor: "#FFFFFF",
                                       operationSelectedColor: "#4566B6",
                                       operationTitleSelectedColor: "#ffffff",
                                       pinPadColor: "#1D1D1D",
                                       pinPadTitleColor: "#FFFFFF",
                                       statusBarStyle: .dark)
            case .washedOut:
                return CalculatorTheme(id: "10",
                                       backgroundColor: "#ECF5FF",
                                       displayColor: "#0D2A4B",
                                       extraFunctionColor: "#A3CFF9",
                                       extraFunctionTitleColor: "#5487BA",
                                       operationColor: "#A3CFF9",
                                       operationTitleColor: "#5487BA",
                                       operationSelectedColor: "#0D2A4B",
                                       operationTitleSelectedColor: "#ffffff",
                                       pinPadColor: "#1D1D1D",
                                       pinPadTitleColor: "#FFFFFF",
                                       statusBarStyle: .dark)
            case .bumbleBee:
                return CalculatorTheme(id: "11",
                                       backgroundColor: "#1C1C1C",
                                       displayColor: "#FFC500",
                                       extraFunctionColor: "#333333",
                                       extraFunctionTitleColor: "#D6D5D4",
                                       operationColor: "#FFC500",
                                       operationTitleColor: "#1C1C1C",
                                       operationSelectedColor: "#333333",
                                       operationTitleSelectedColor: "#D6D5D4",
                                       pinPadColor: "#333333",
                                       pinPadTitleColor: "#D6D5D4",
                                       statusBarStyle: .light)
            case .futuristic:
                return CalculatorTheme(id: "12",
                                       backgroundColor: "#054F61",
                                       displayColor: "#E9F2FB",
                                       extraFunctionColor: "#003748",
                                       extraFunctionTitleColor: "#E9F2FB",
                                       operationColor: "#20C1F2",
                                       operationTitleColor: "#E9F2FB",
                                       operationSelectedColor: "#F240EE",
                                       operationTitleSelectedColor: "#E9F2FB",
                                       pinPadColor: "#333333",
                                       pinPadTitleColor: "#E9F2FB",
                                       statusBarStyle: .light)
            case .lipStick:
                return CalculatorTheme(id: "13",
                                       backgroundColor: "#FE3787",
                                       displayColor: "#FFFFFF",
                                       extraFunctionColor: "#F7F7F7",
                                       extraFunctionTitleColor: "#454545",
                                       operationColor: "#20C1F2",
                                       operationTitleColor: "#FFFFFF",
                                       operationSelectedColor: "#F7F7F7",
                                       operationTitleSelectedColor: "#FE3787",
                                       pinPadColor: "#FFFFFF",
                                       pinPadTitleColor: "#FE3787",
                                       statusBarStyle: .light)
            case .strange:
                return CalculatorTheme(id: "14",
                                       backgroundColor: "#333333",
                                       displayColor: "#FFFFFF",
                                       extraFunctionColor: "#333333",
                                       extraFunctionTitleColor: "#FF9933",
                                       operationColor: "#333333",
                                       operationTitleColor: "#FF9933",
                                       operationSelectedColor: "#FFFFFF",
                                       operationTitleSelectedColor: "#333333",
                                       pinPadColor: "#333333",
                                       pinPadTitleColor: "#FFFFFF",
                                       statusBarStyle: .light)
            case .peach:
                return CalculatorTheme(id: "15",
                                       backgroundColor: "#FFAB97",
                                       displayColor: "#FFF7EA",
                                       extraFunctionColor: "#F99582",
                                       extraFunctionTitleColor: "#FFF7EA",
                                       operationColor: "#F99582",
                                       operationTitleColor: "#FFF7EA",
                                       operationSelectedColor: "#B7442A",
                                       operationTitleSelectedColor: "#FFF7EA",
                                       pinPadColor: "#FF8368",
                                       pinPadTitleColor: "#FFF7EA",
                                       statusBarStyle: .light)
            case .pinkDots:
                return CalculatorTheme(id: "16",
                                       backgroundColor: "#FFFFFF",
                                       displayColor: "#FF3797",
                                       extraFunctionColor: "#F7F7F7",
                                       extraFunctionTitleColor: "#0F0F0F",
                                       operationColor: "#FF3797",
                                       operationTitleColor: "#FFFFFF",
                                       operationSelectedColor: "#F7F7F7",
                                       operationTitleSelectedColor: "#FF3797",
                                       pinPadColor: "#F7F7F7",
                                       pinPadTitleColor: "#0F0F0F",
                                       statusBarStyle: .light)
            }
        }
    }
}
