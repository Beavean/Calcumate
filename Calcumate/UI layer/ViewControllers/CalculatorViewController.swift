//
//  CalculatorViewController.swift
//  Calcumate
//
//  Created by Beavean on 17.08.2022.
//

import UIKit

final class CalculatorViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var displayView: DisplayView!
    @IBOutlet var themeChangeButton: UIButton!
    @IBOutlet var pinPadButton0: UIButton!
    @IBOutlet var pinPadButton1: UIButton!
    @IBOutlet var pinPadButton2: UIButton!
    @IBOutlet var pinPadButton3: UIButton!
    @IBOutlet var pinPadButton4: UIButton!
    @IBOutlet var pinPadButton5: UIButton!
    @IBOutlet var pinPadButton6: UIButton!
    @IBOutlet var pinPadButton7: UIButton!
    @IBOutlet var pinPadButton8: UIButton!
    @IBOutlet var pinPadButton9: UIButton!
    @IBOutlet var decimalButton: UIButton!
    @IBOutlet var clearButton: UIButton!
    @IBOutlet var negateButton: UIButton!
    @IBOutlet var percentageButton: UIButton!
    @IBOutlet var equalsButton: UIButton!
    @IBOutlet var divideButton: UIButton!
    @IBOutlet var multiplyButton: UIButton!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var minusButton: UIButton!

    // MARK: - Properties

    var needToDisplayWelcomeAnimations = true

    // MARK: - Color themes

    private var currentTheme: CalculatorTheme {
        return ThemeManager.shared.currentTheme
    }

    // MARK: - Calculator Engine

    private var calculatorEngine = CalculatorEngine()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        redecorateView()
        registerForNotifications()
        prepareForWelcomeAnimations()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if needToDisplayWelcomeAnimations {
            needToDisplayWelcomeAnimations = false
            displayWelcomeAnimations()
        }
    }

    private func prepareForWelcomeAnimations() {
        displayView.alpha = 0
    }

    private func displayWelcomeAnimations() {
        let didRestoreFromLastSession = calculatorEngine.restoreFromLastSession()
        refreshDisplay()
        let timeDelay: TimeInterval = 0.25
        if didRestoreFromLastSession {
            slideInDisplay(withDelay: timeDelay)
        } else {
            fadeDisplay(withDelay: timeDelay)
        }
    }

    private func fadeDisplay(withDelay delay: TimeInterval) {
        UIView.animate(withDuration: 0.5, delay: delay, options: .curveEaseOut) { [weak self] in
            self?.displayView.alpha = 1
        } completion: { _ in
        }
    }

    private func slideInDisplay(withDelay delay: TimeInterval) {
        displayView.transform = CGAffineTransform(translationX: 0, y: displayView.frame.height)
        UIView.animate(withDuration: 0.25, delay: delay, options: .curveEaseOut) { [weak self] in
            self?.displayView.alpha = 1
            self?.displayView.transform = CGAffineTransform.identity
        } completion: { _ in
        }
    }

    // MARK: - Theme Button actions

    @IBAction func changeThemeButtonPressed(_ sender: UIButton) {
        sender.bounce()
        decorateViewWithNextTheme()
    }

    // MARK: - Decoration

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
        let image = usingSlicedImage ? UIImage(named: UIImage.Names.circleSliced) : UIImage(named: UIImage.Names.circle)
        button.setBackgroundImage(image, for: .normal)
        button.backgroundColor = .clear
    }

    private func decorateExternalFunctionButton(_ button: UIButton) {
        decorateButton(button)
        button.tintColor = UIColor(hex: currentTheme.extraFunctionColor)
        button.setTitleColor(UIColor(hex: currentTheme.extraFunctionTitleColor), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        if button.isSelected {
            selectOperationButton(button, true)
        }
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

    // MARK: - Select Operation Buttons

    private func deselectOperationButton() {
        selectOperationButton(divideButton, false)
        selectOperationButton(multiplyButton, false)
        selectOperationButton(minusButton, false)
        selectOperationButton(addButton, false)
    }

    private func selectOperationButton(_ button: UIButton, _ selected: Bool) {
        let operationSelectedColor: UIColor? = UIColor(hex: currentTheme.operationSelectedColor)
        let operationColor: UIColor? = UIColor(hex: currentTheme.operationColor)
        button.tintColor = selected ? operationSelectedColor : operationColor
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
        calculatorEngine.pinPadPressed(number)
        refreshDisplay()
    }

    // MARK: - Refresh Display

    private func refreshDisplay() {
        displayView.label.text = calculatorEngine.displayText
    }

    // MARK: - History Log View

    private func presentHistoryLogView() {
        let storyboard = UIStoryboard(name: UIStoryboard.Names.mainStoryboard, bundle: nil)
        guard let logViewController = storyboard
            .instantiateViewController(withIdentifier: UIStoryboard.Names.logViewController) as? LogViewController
        else { return }
        logViewController.datasource = calculatorEngine.historyLog
        let navigationController = UINavigationController(rootViewController: logViewController)
        let theme = ThemeManager.shared.currentTheme
        navigationController.navigationBar.backgroundColor = UIColor(hex: theme.backgroundColor)
        navigationController.navigationBar.tintColor = UIColor(hex: theme.displayColor)
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        present(navigationController, animated: true)
    }

    // MARK: - Copy & Paste

    private func pasteNumberIntoCalculator(from decimal: Decimal) {
        calculatorEngine.pasteInNumber(from: decimal)
        refreshDisplay()
    }

    private func pasteMathEquationIntoCalculator(from mathEquation: MathematicalEquation) {
        calculatorEngine.pasteInMathEquation(from: mathEquation)
        refreshDisplay()
    }
}

// MARK: - Notifications

extension CalculatorViewController {
    private func registerForNotifications() {
        let pasteNumberNotification = Notification.Name(DisplayView.Names.pasteNumberKey)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didReceivePasteNotification(notification:)),
                                               name: pasteNumberNotification,
                                               object: nil)
        let historyLogNotification = Notification.Name(DisplayView.Names.historyLogNotification)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didReceiveHistoryLogNotification(notification:)),
                                               name: historyLogNotification,
                                               object: nil)
        let pasteEquationNotification = Notification.Name(LogViewController.Names.pasteEquationNotification)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didReceivePasteEquationNotification(notification:)),
                                               name: pasteEquationNotification,
                                               object: nil)
    }

    @objc private func didReceivePasteEquationNotification(notification: Notification) {
        guard let mathEquation = notification.userInfo?[LogViewController.Names.pasteNumberKey] as? MathematicalEquation
        else { return }
        pasteMathEquationIntoCalculator(from: mathEquation)
    }

    @objc private func didReceivePasteNotification(notification: Notification) {
        guard let doubleValue = notification.userInfo?[DisplayView.Names.pasteNumberKey] as? Double else { return }
        pasteNumberIntoCalculator(from: Decimal(doubleValue))
    }

    @objc private func didReceiveHistoryLogNotification(notification _: Notification) {
        presentHistoryLogView()
    }
}
