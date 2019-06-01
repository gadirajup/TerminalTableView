//
//  EditCommandViewController.swift
//  TerminalTableView
//
//  Created by Prudhvi Gadiraju on 6/1/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class EditCommandViewController: UITableViewController {
    
    var activeCommand: Command!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(ToggleCommandCell.self, forCellReuseIdentifier: "Toggle")
        tableView.register(TextCommandCell.self, forCellReuseIdentifier: "Text")
        tableView.keyboardDismissMode = .interactive
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return activeCommand.options.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let item = activeCommand.options[section]
        
        if item is SelectCommand {
            return item.text
        } else if item is TextCommand {
            return item.text
        }
        
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let item = activeCommand.options[section]
        
        if item.text.isEmpty {
            return 5
        } else {
            return 44
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == tableView.numberOfSections - 1 {
            return 44
        } else {
            return .leastNonzeroMagnitude
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let item = activeCommand.options[section]
        
        if let select = item as? SelectCommand {
            return select.friendlyValues.count
        } else if item is TextCommand {
            return 1
        } else if item is ToggleCommand {
            return 1
        } else {
            fatalError()
        }
    }
    
    func cell(for command: ToggleCommand, at IndexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Toggle", for: IndexPath) as? ToggleCommandCell else { fatalError() }
        
        cell.textLabel?.text = command.text
        cell.toggle.isOn = command.value
        
        cell.switchChangedAction = { [weak self] value in
            guard let checkCommand = self?.activeCommand.options[IndexPath.section] as? ToggleCommand else { return }
            checkCommand.value = value
        }
        
        return cell
    }
    
    func cell(for command: TextCommand, at indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Text", for: indexPath) as? TextCommandCell else { fatalError() }
        
        cell.textViewChangedAction = { [weak self] newText in
            guard let textCommand = self?.activeCommand.options[indexPath.section] as? TextCommand else { return }
            textCommand.value = newText
        }
        
        
        if command.placeHolder.isEmpty {
            cell.textField.placeholder = "Enter text"
        } else {
            cell.textField.placeholder = command.placeHolder
        }
        
        if command.isNumeric {
            cell.textField.keyboardType = .decimalPad
        } else {
            cell.textField.keyboardType = .default
        }
        
        cell.textLabel?.text = command.value

        return cell
    }
    
    func cell(for command: SelectCommand, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = command.friendlyValues[indexPath.row]
        
        if indexPath.row == command.value {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = activeCommand.options[indexPath.row]
        
        if let select = item as? SelectCommand {
            return cell(for: select, at: indexPath)
        } else if let check = item as? ToggleCommand {
            return cell(for: check, at: indexPath)
        } else if let text = item as? TextCommand {
            return cell(for: text, at: indexPath)
        } else {
            fatalError("Unknown Command Type")
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let selectCommand = activeCommand.options[indexPath.section] as? SelectCommand else { return }
        
        selectCommand.value = indexPath.row
        
        for cell in tableView.visibleCells {
            guard let cellIndexPath = tableView.indexPath(for: cell) else { return }
            guard indexPath.section == cellIndexPath.section else { continue }
            
            cell.accessoryType = .none
        }
        
        let selected = tableView.cellForRow(at: indexPath)
        selected?.accessoryType = .checkmark
    }
}
