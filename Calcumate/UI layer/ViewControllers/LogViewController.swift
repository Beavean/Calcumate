//
//  LogViewController.swift
//  Calcumate
//
//  Created by Beavean on 23.08.2022.
//

import UIKit

class LogViewController: UITableViewController {
    
    //MARK: - Datasource
    
    var datasource: [MathematicalEquation] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        decorateView()
        setupNavigationBar()
    }

    //MARK: - Navigation Bar
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonPressed))
    }
    
    @objc private func doneButtonPressed() {
        dismiss(animated: true)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EquationTableViewCell", for: indexPath) as? EquationTableViewCell else { return UITableViewCell() }
        let equation = datasource[indexPath.row]
        cell.leftSideLabel.text = equation.leftSide.formatted()
        cell.rightSideLabel.text = equation.generateStringFromOperation() + " " + (equation.rightSide?.formatted() ?? "")
        cell.resultLabel.text = "= " + (equation.result?.formatted() ?? "")
        cell.selectedBackgroundView = UIView()
        decorateCell(cell)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let equation = datasource[indexPath.row]
        let userInfo: [AnyHashable: Any] = ["PasteKey" : equation]
        NotificationCenter.default.post(name: NSNotification.Name("Calcumate.LogView.pasteMathEquation"), object: nil, userInfo: userInfo)
        dismiss(animated: true)
    }
    
    //MARK: - Decorate
    
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
