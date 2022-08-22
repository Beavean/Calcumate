//
//  CalculatorViewController.swift
//  Calcumate
//
//  Created by Beavean on 17.08.2022.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var displayView: DisplayView!
    @IBOutlet weak var themeChangeButton: UIButton!
    
    @IBOutlet weak var pinPadButton0: UIButton!
    @IBOutlet weak var pinPadButton1: UIButton!
    @IBOutlet weak var pinPadButton2: UIButton!
    @IBOutlet weak var pinPadButton3: UIButton!
    @IBOutlet weak var pinPadButton4: UIButton!
    @IBOutlet weak var pinPadButton5: UIButton!
    @IBOutlet weak var pinPadButton6: UIButton!
    @IBOutlet weak var pinPadButton7: UIButton!
    @IBOutlet weak var pinPadButton8: UIButton!
    @IBOutlet weak var pinPadButton9: UIButton!
    @IBOutlet weak var decimalButton: UIButton!
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var negateButton: UIButton!
    @IBOutlet weak var percentageButton: UIButton!
    
    @IBOutlet weak var equalsButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    //MARK: - Color themes
    
    private var currentTheme: CalculatorTheme {
        return ThemeManager.shared.currentTheme
    }
    
    //MARK: - Calculator Engine
    
    private var calculatorEngine = CalculatorEngine()
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redecorateView()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Theme Button actions
    
    @IBAction func changeThemeButtonPressed(_ sender: UIButton) {
        decorateViewWithNextTheme()
    }
    
    
    //MARK: - Decoration
    
    private func decorateViewWithNextTheme() {
        ThemeManager.shared.moveToNextTheme()
        redecorateView()
    }
    
    private func redecorateView() {
        view.backgroundColor = UIColor(hex: currentTheme.backgroundColor)
        displayView.backgroundColor = .clear
        displayView.label.textColor = UIColor(hex: currentTheme.displayColor)
        themeChangeButton.tintColor = UIColor(hex: currentTheme.displayColor)
        setNeedsStatusBarAppearanceUpdate()
        decorateButtons()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        switch currentTheme.statusBarStyle {
        case .light: return .lightContent
        case .dark: return .darkContent
        }
    }
    
    private func decorateButtons() {
        decoratePinPadButton(pinPadButton0, true)
        decoratePinPadButton(pinPadButton1)
        decoratePinPadButton(pinPadButton2)
        decoratePinPadButton(pinPadButton3)
        decoratePinPadButton(pinPadButton4)
        decoratePinPadButton(pinPadButton5)
        decoratePinPadButton(pinPadButton6)
        decoratePinPadButton(pinPadButton7)
        decoratePinPadButton(pinPadButton8)
        decoratePinPadButton(pinPadButton9)
        decoratePinPadButton(decimalButton)
        decorateExternalFunctionButton(clearButton)
        decorateExternalFunctionButton(negateButton)
        decorateExternalFunctionButton(percentageButton)
        decorateOperationButton(equalsButton)
        decorateOperationButton(divideButton)
        decorateOperationButton(multiplyButton)
        decorateOperationButton(addButton)
        decorateOperationButton(minusButton)
    }
    
    private func decorateButton(_ button: UIButton, _ usingSlicedImage: Bool = false) {
        button.tintColor = .orange
        let image = usingSlicedImage ? UIImage(named: "CircleSliced") : UIImage(named: "Circle")
        button.setBackgroundImage(image, for: .normal)
        button.backgroundColor = .clear
    }
    
    private func decorateExternalFunctionButton(_ button: UIButton) {
        decorateButton(button)
        button.tintColor = UIColor(hex: currentTheme.extraFunctionColor)
        button.setTitleColor(UIColor(hex: currentTheme.extraFunctionTitleColor), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
    }
    
    private func decorateOperationButton(_ button: UIButton) {
        decorateButton(button)
        button.tintColor = UIColor(hex: currentTheme.operationColor)
        button.setTitleColor(UIColor(hex: currentTheme.operationTitleColor), for: .normal)
        button.setTitleColor(UIColor(hex: currentTheme.operationTitleSelectedColor), for: .selected)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50)
    }
    
    private func decoratePinPadButton(_ button: UIButton, _ usingSlicedImage: Bool = false) {
        decorateButton(button, usingSlicedImage)
        button.tintColor = UIColor(hex: currentTheme.pinPadColor)
        button.setTitleColor(UIColor(hex: currentTheme.pinPadTitleColor), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
    }
    
    //MARK: - Select Operation Buttons
    
    private func deselectOperationButton() {
        selectOperationButton(divideButton, false)
        selectOperationButton(multiplyButton, false)
        selectOperationButton(minusButton, false)
        selectOperationButton(addButton, false)
        
    }
    
    private func selectOperationButton(_ button: UIButton, _ selected: Bool) {
        button.tintColor = selected ? UIColor(hex: currentTheme.operationSelectedColor) : UIColor(hex: currentTheme.operationColor)
        button.isSelected = selected
    }
    
    // MARK: - IBActions
    
    @IBAction private func clearPressed() {
        deselectOperationButton()
        calculatorEngine.clearPressed()
        refreshDisplay()
    }
    
    @IBAction private func negatePressed() {
        calculatorEngine.negatePressed()
        refreshDisplay()
    }
    
    @IBAction private func percentagePressed() {
        calculatorEngine.percentagePressed()
        refreshDisplay()
    }
    
    // MARK: - Operations
    
    @IBAction private func addPressed() {
        deselectOperationButton()
        selectOperationButton(addButton, true)
        calculatorEngine.addPressed()
        refreshDisplay()
    }
    
    @IBAction private func minusPressed() {
        deselectOperationButton()
        selectOperationButton(minusButton, true)
        calculatorEngine.subtractPressed()
        refreshDisplay()
    }
    
    @IBAction private func multiplyPressed() {
        deselectOperationButton()
        selectOperationButton(multiplyButton, true)
        calculatorEngine.multiplyPressed()
        refreshDisplay()
    }
    
    @IBAction private func dividePressed() {
        deselectOperationButton()
        selectOperationButton(divideButton, true)
        calculatorEngine.dividePressed()
        refreshDisplay()
    }
    
    @IBAction private func equalsPressed() {
        calculatorEngine.equalsPressed()
        refreshDisplay()
    }
    
    // MARK: - Number Input
    
    @IBAction private func decimalPressed() {
        deselectOperationButton()
        calculatorEngine.decimalPressed()
        refreshDisplay()
    }
    
    @IBAction private func numberPressed(_ sender: UIButton) {
        deselectOperationButton()
        let number = sender.tag
        calculatorEngine.numberPressed(number)
        refreshDisplay()
    }
    
    //MARK: - Refresh Display
    
    private func refreshDisplay() {
        displayView.label.text = calculatorEngine.displayText
    }
}


