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
    
    //MARK: - UI Menu Controller
    
    private func showMenu(from gestureRecogniser: UILongPressGestureRecognizer) {
        becomeFirstResponder()
        let menu = UIMenuController.shared
        guard menu.isMenuVisible == false else { return }
        let locationOfGesture = gestureRecogniser.location(in: self)
        var rect = bounds
        rect.origin = locationOfGesture
        rect.origin.y = rect.origin.y - 30
        rect.size = CGSize(width: 1, height: 44)
        menu.showMenu(from: self, rect: rect)
    }
    
    private func hideMenu() {
        UIMenuController.shared.hideMenu(from: self)
    }
    
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return action == #selector(UIResponderStandardEditActions.copy(_:)) || action == #selector(UIResponderStandardEditActions.paste(_:))
    }
    
    @objc override func copy(_ sender: Any?) {
        UIPasteboard.general.string = label.text
    }
    
    override func paste(_ sender: Any?) {
        guard let pasteNumber = UIPasteboard.general.string?.doubleValue else { return }
        let userInfo: [AnyHashable: Any] = ["PasteKey": pasteNumber]
        NotificationCenter.default.post(name: Notification.Name("Calcumate.DisplayView.pasteNumber"), object: nil, userInfo: userInfo)
    }
    
    //MARK: - Color Themes methods
    
    func prepareForColorThemeUpdate() {
        hideMenu()
    }
}
