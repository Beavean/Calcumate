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
        layer.cornerRadius = self.frame.height / 10
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
        registerNotifications()
        selectScreen()
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
    
    func prepareForThemeUpdate() {
        deselectScreen(animated: false)
        hideMenu()
    }
    
    //MARK: - Animations
    
    private func selectScreen() {
        let theme = ThemeManager.shared.currentTheme
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut) { [weak self] in
            self?.backgroundColor = UIColor(hex: theme.operationColor)
            self?.label.textColor = UIColor(hex: theme.operationTitleColor)
        } completion: { _ in
            
        }

    }
    
    private func deselectScreen(animated: Bool) {
        let theme = ThemeManager.shared.currentTheme
        let duration = animated ? 0.15 : 0
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut) { [weak self] in
            self?.backgroundColor = UIColor.clear
            self?.label.textColor = UIColor(hex: theme.displayColor)
        } completion: { _ in
            
        }
    }
    
    //MARK: - Notifications
    
    private func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.willHideEditMenu(_:)), name: UIMenuController.willHideMenuNotification, object: nil)
    }
    
    private func unregisterNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIMenuController.willHideMenuNotification, object: nil)
    }
    
    @objc private func willHideEditMenu(_ notification: Notification) {
        deselectScreen(animated: true)
        unregisterNotifications()
    }
}
