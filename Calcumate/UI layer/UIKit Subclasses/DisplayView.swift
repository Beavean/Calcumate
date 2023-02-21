//
//  DisplayView.swift
//  Calcumate
//
//  Created by Beavean on 22.08.2022.
//

import UIKit

final class DisplayView: UIView {
    // MARK: - IBOutlets

    @IBOutlet var label: UILabel!

    // MARK: - Custom Menu Items

    private var logMenuItem: UIMenuItem {
        return UIMenuItem(title: "View Log", action: #selector(displayHistoryLog))
    }

    @objc private func displayHistoryLog() {
        NotificationCenter.default.post(name: Notification.Name(DisplayView.Names.historyLogNotification), object: nil)
    }

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
        layer.cornerRadius = frame.height / 10
        addMenuGestureRecogniser()
    }

    // MARK: - Gesture Recogniser

    private func addMenuGestureRecogniser() {
        let longPressGesture = UILongPressGestureRecognizer(target: self,
                                                            action: #selector(longPressGestureEventFired(_:)))
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

    // MARK: - UI Menu Controller

    private func showMenu(from gestureRecogniser: UILongPressGestureRecognizer) {
        registerNotifications()
        selectScreen()
        becomeFirstResponder()
        let menu = UIMenuController.shared
        menu.menuItems = [logMenuItem]
        guard menu.isMenuVisible == false else { return }
        let locationOfGesture = gestureRecogniser.location(in: self)
        var rect = bounds
        rect.origin = locationOfGesture
        rect.origin.y -= 30
        rect.size = CGSize(width: 1, height: 44)
        menu.showMenu(from: self, rect: rect)
    }

    private func hideMenu() {
        UIMenuController.shared.hideMenu(from: self)
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }

    override func canPerformAction(_ action: Selector, withSender _: Any?) -> Bool {
        return action == #selector(UIResponderStandardEditActions.copy(_:))
        || action == #selector(UIResponderStandardEditActions.paste(_:))
        || action == #selector(displayHistoryLog)
    }

    @objc override func copy(_: Any?) {
        UIPasteboard.general.string = label.text
    }

    override func paste(_: Any?) {
        guard let pasteNumber = UIPasteboard.general.string?.doubleValue else { return }
        let userInfo: [AnyHashable: Any] = [DisplayView.Names.pasteNumberKey: pasteNumber]
        NotificationCenter.default.post(name: Notification.Name(DisplayView.Names.pasteNumberNotification),
                                        object: nil,
                                        userInfo: userInfo)
    }

    // MARK: - Color Themes methods

    func prepareForThemeUpdate() {
        deselectScreen(animated: false)
        hideMenu()
    }

    // MARK: - Animations

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

    // MARK: - Notifications

    private func registerNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(willHideEditMenu(_:)),
                                               name: UIMenuController.willHideMenuNotification,
                                               object: nil)
    }

    private func unregisterNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIMenuController.willHideMenuNotification, object: nil)
    }

    @objc private func willHideEditMenu(_: Notification) {
        deselectScreen(animated: true)
        unregisterNotifications()
    }
}
