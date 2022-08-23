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
        registerForNotifications()
    }
    
    //MARK: - Theme Button actions
    
    @IBAction func changeThemeButtonPressed(_ sender: UIButton) {
        sender.bounce()
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
        clearButton.bounce()
        deselectOperationButton()
        calculatorEngine.clearPressed()
        refreshDisplay()
    }
    
    @IBAction private func negatePressed() {
        negateButton.bounce()
        calculatorEngine.negatePressed()
        refreshDisplay()
    }
    
    @IBAction private func percentagePressed() {
        percentageButton.bounce()
        calculatorEngine.percentagePressed()
        refreshDisplay()
    }
    
    // MARK: - Operations
    
    @IBAction private func addPressed() {
        addButton.bounce()
        deselectOperationButton()
        selectOperationButton(addButton, true)
        calculatorEngine.addPressed()
        refreshDisplay()
    }
    
    @IBAction private func minusPressed() {
        minusButton.bounce()
        deselectOperationButton()
        selectOperationButton(minusButton, true)
        calculatorEngine.subtractPressed()
        refreshDisplay()
    }
    
    @IBAction private func multiplyPressed() {
        multiplyButton.bounce()
        deselectOperationButton()
        selectOperationButton(multiplyButton, true)
        calculatorEngine.multiplyPressed()
        refreshDisplay()
    }
    
    @IBAction private func dividePressed() {
        divideButton.bounce()
        deselectOperationButton()
        selectOperationButton(divideButton, true)
        calculatorEngine.dividePressed()
        refreshDisplay()
    }
    
    @IBAction private func equalsPressed() {
        equalsButton.bounce()
        calculatorEngine.equalsPressed()
        refreshDisplay()
    }
    
    // MARK: - Number Input
    
    @IBAction private func decimalPressed() {
        decimalButton.bounce()
        deselectOperationButton()
        calculatorEngine.decimalPressed()
        refreshDisplay()
    }
    
    @IBAction private func numberPressed(_ sender: UIButton) {
        sender.bounce()
        deselectOperationButton()
        let number = sender.tag
        calculatorEngine.numberPressed(number)
        refreshDisplay()
    }
    
    //MARK: - Refresh Display
    
    private func refreshDisplay() {
        displayView.label.text = calculatorEngine.displayText
    }
    
    //MARK: - Notifications
    
    private func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.didReceivePasteNotification(notification:)), name: Notification.Name("Calcumate.DisplayView.pasteNumber"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.didReceiveHistoryLogNotification(notification:)), name: Notification.Name("Calcumate.DisplayView.displayHistory"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(didReceivePasteMathEquationNotification(notification:)), name: Notification.Name("Calcumate.LogView.pasteMathEquation"), object: nil)
    }
    
    @objc private func didReceivePasteMathEquationNotification(notification: Notification) {
        guard let mathEquation = notification.userInfo?["PasteKey"] as? MathematicalEquation else { return }
        pasteMathEquationIntoCalculator(from: mathEquation)
    }
    
    @objc private func didReceivePasteNotification(notification: Notification){
        guard let doubleValue = notification.userInfo?["PasteKey"] as? Double else { return }
        pasteNumberIntoCalculator(from: Decimal(doubleValue))
    }
    
    @objc private func didReceiveHistoryLogNotification(notification: Notification) {
        presentHistoryLogView()
    }
    
    
    //MARK: - History Log View
    
    private func presentHistoryLogView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let logViewController = storyboard.instantiateViewController(withIdentifier: "LogViewController") as? LogViewController else { return }
        logViewController.datasource = calculatorEngine.historyLog
        let navigationController = UINavigationController(rootViewController: logViewController)
        let theme = ThemeManager.shared.currentTheme
        navigationController.navigationBar.backgroundColor = UIColor(hex: theme.backgroundColor)
        navigationController.navigationBar.tintColor = UIColor(hex: theme.displayColor)
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        present(navigationController, animated: true)
    }
    
    //MARK: - Copy & Paste
    
    private func pasteNumberIntoCalculator(from decimal: Decimal) {
        calculatorEngine.pasteInNumber(from: decimal)
        refreshDisplay()
    }
    
    private func pasteMathEquationIntoCalculator(from mathEquation: MathematicalEquation) {
        calculatorEngine.pasteInMathEquation(from: mathEquation)
        refreshDisplay()
    }
}


