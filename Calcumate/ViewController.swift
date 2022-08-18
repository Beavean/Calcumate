//
//  ViewController.swift
//  Calcumate
//
//  Created by Beavean on 17.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayView: UIView!
    @IBOutlet weak var displayLabel: UILabel!
    
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
    
    var currentTheme: CalculatorTheme {
        return CalculatorTheme(backgroundColor: "#000000", displayColor: "#FFFFFF", extraFunctionColor: "#000000", extraFunctionTitleColor: "#FFFFFF", operationColor: "#000000", operationTitleColor: "#FFFFFF", pinPadColor: "#000000", pinPadTitleColor: "#FFFFFF")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decorateView()
        // Do any additional setup after loading the view.
    }
    
    private func decorateView() {

        view.backgroundColor = UIColor(hex: currentTheme.backgroundColor)
        displayLabel.textColor = UIColor(hex: currentTheme.displayColor)
        
        decorateButtons()
    }
    
    private func decorateButtons() {
        decoratePinPadButton(pinPadButton0)
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
    
    private func decorateButton(_ button: UIButton) {
        button.tintColor = .orange
        button.backgroundColor = .clear
        button.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
    }
    
    private func decorateExternalFunctionButton(_ button: UIButton) {
        decorateButton(button)
        
        button.tintColor = UIColor(hex: currentTheme.extraFunctionColor)
        button.setTitleColor(UIColor(hex: currentTheme.extraFunctionTitleColor), for: .normal)
    }
    
    private func decorateOperationButton(_ button: UIButton) {
        decorateButton(button)

        
        button.tintColor = UIColor(hex: currentTheme.operationColor)
        button.setTitleColor(UIColor(hex: currentTheme.operationTitleColor), for: .normal)
    }
    
    private func decoratePinPadButton(_ button: UIButton) {
        decorateButton(button)

        
        button.tintColor = UIColor(hex: currentTheme.pinPadColor)
        button.setTitleColor(UIColor(hex: currentTheme.pinPadTitleColor), for: .normal)
    }
}

