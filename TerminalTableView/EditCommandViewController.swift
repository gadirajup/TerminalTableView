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
}
