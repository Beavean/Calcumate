//
//  LogViewController.swift
//  Calcumate
//
//  Created by Beavean on 23.08.2022.
//

import UIKit

final class LogViewController: UITableViewController {
    // MARK: - Datasource

    var datasource: [MathematicalEquation] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        decorateView()
        setupNavigationBar()
    }

    // MARK: - Navigation Bar

    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,
                                                            target: self,
                                                            action: #selector(doneButtonPressed))
    }

    @objc private func doneButtonPressed() {
        dismiss(animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return datasource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EquationTableViewCell",
                                                       for: indexPath) as? EquationTableViewCell,
                let equation = datasource[safe: indexPath.row]
        else { return UITableViewCell() }
        cell.leftSideLabel.text = equation.leftSide.formatted()
        cell.rightSideLabel.text = equation.stringFromOperation() + " " + (equation.rightSide?.formatted() ?? "")
        cell.resultLabel.text = "= " + (equation.result?.formatted() ?? "")
        cell.selectedBackgroundView = UIView()
        decorateCell(cell)
        return cell
    }

    override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 170
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? EquationTableViewCell,
              let equation = datasource[safe: indexPath.row]
        else { return }
        let userInfo: [AnyHashable: Any] = [LogViewController.Names.pasteNumberKey: equation]
        NotificationCenter.default.post(name: NSNotification.Name(LogViewController.Names.pasteEquationNotification),
                                        object: nil,
                                        userInfo: userInfo)
        tableView.isUserInteractionEnabled = false
        cell.displayTick()
        dismissAfterDelay()
    }

    private func dismissAfterDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.dismiss(animated: true)
        }
    }

    // MARK: - Decorate

    private func decorateCell(_ cell: EquationTableViewCell) {
        let theme = ThemeManager.shared.currentTheme
        cell.backgroundColor = UIColor(hex: theme.backgroundColor)
        cell.selectedBackgroundView?.backgroundColor = UIColor(hex: theme.operationColor)
        cell.resultLabel.textColor = UIColor(hex: theme.displayColor)
        cell.leftSideLabel.textColor = UIColor(hex: theme.displayColor)
        cell.rightSideLabel.textColor = UIColor(hex: theme.displayColor)
        cell.resultLabel.highlightedTextColor = UIColor(hex: theme.backgroundColor)
        cell.leftSideLabel.highlightedTextColor = UIColor(hex: theme.backgroundColor)
        cell.rightSideLabel.highlightedTextColor = UIColor(hex: theme.backgroundColor)
        cell.tickView.tintColor = UIColor(hex: theme.operationTitleColor)
    }

    private func decorateView() {
        let theme = ThemeManager.shared.currentTheme
        tableView.backgroundColor = UIColor(hex: theme.backgroundColor)
        tableView.tintColor = UIColor(hex: theme.displayColor)
        tableView.separatorColor = UIColor(hex: theme.displayColor)
        switch theme.statusBarStyle {
        case .dark: tableView.indicatorStyle = .black
        case .light: tableView.indicatorStyle = .white
        }
    }
}
