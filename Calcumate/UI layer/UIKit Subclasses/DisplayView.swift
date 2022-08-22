//
//  DisplayView.swift
//  Calcumate
//
//  Created by Beavean on 22.08.2022.
//

import UIKit

class DisplayView: UIView {
    
    //MARK: - IBOutlets
    
    @IBOutlet var label: UILabel!
    
    // MARK: - Initialisers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    private func sharedInit() {
        addMenuGestureRecogniser()
    }
    
    //MARK: - Gesture Recogniser
    
    private func addMenuGestureRecogniser() {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressGestureEventFired(_:)))
        addGestureRecognizer(longPressGesture)
    }
    
    @objc private func longPressGestureEventFired(_ gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
        case .began:
            showMenu(from: gesture)
        default:
            break
        }
    }
    
    private func showMenu(from gestureRecogniser: UILongPressGestureRecognizer) {
        let menu = UIMenuController.shared
        guard menu.isMenuVisible == false else { return }
        
        
    }
}
