//
//  ViewController.swift
//  Calcumate
//
//  Created by Beavean on 17.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var negateButton: UIButton!
    @IBOutlet weak var percentageButton: UIButton!
    
    @IBOutlet weak var equalsButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var decimalButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decorateView()
        // Do any additional setup after loading the view.
    }

    private func decorateView() {
        decorateButton(pinPadButton0)
        decorateButton(pinPadButton1)
        decorateButton(pinPadButton2)
        decorateButton(pinPadButton3)
        decorateButton(pinPadButton4)
        decorateButton(pinPadButton5)
        decorateButton(pinPadButton6)
        decorateButton(pinPadButton7)
        decorateButton(pinPadButton8)
        decorateButton(pinPadButton9)
        decorateButton(clearButton)
        decorateButton(negateButton)
        decorateButton(percentageButton)
        decorateButton(equalsButton)
        decorateButton(divideButton)
        decorateButton(addButton)
        decorateButton(minusButton)
        decorateButton(decimalButton)
        decorateButton(multiplyButton)
    }
    
    private func decorateButton(_ button: UIButton) {
        button.tintColor = .orange
        button.backgroundColor = .clear
        button.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
    }
    
    private func decorateExternalFunctionButton(_ button: UIButton) {
        
    }
    
    private func decorateOperationButton(_ button: UIButton) {
        
    }
    
    private func decoratePinPadButton(_ button: UIButton) {
        
    }

}

