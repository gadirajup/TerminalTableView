//
//  CommandsViewController.swift
//  TerminalTableView
//
//  Created by Prudhvi Gadiraju on 5/30/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class CommandsViewController: UITableViewController {
    
    var commands = [Command]()
    var terminalViewController: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        let ps = Command(friendlyName: "Show all processes", rootCommand: "ps aux", mustBeFirst: true, options: [])
        let less = Command(friendlyName: "Use Scroll View", rootCommand: "less", mustBeFirst: false, options: [])
        
        let count1 = SelectCommand(text: "Count", prefix: "", value: 0, friendlyValues: ["Letters", "Lines", "Words"], actualValues: ["-c", "-l", "-c"])
        let count = Command(friendlyName: "Count Input", rootCommand: "wc ", mustBeFirst: false, options: [count1])
        
        let find1 = SelectCommand(text: "Start from", prefix: "", value: 0, friendlyValues: ["The current directory", "Your home directory", "The root directory", "Somewhere else"], actualValues: [".", "-", "/", "/path/to/your/directory"])
        let find2 = ToggleCommand(text: "Ignore Case", prefix: "", checkedCommand: "-iname", uncheckedCommand: "-name", value: false)
        let find3 = TextCommand(text: "Filename", prefix: "", placeHolder: "", isNumeric: false, value: "")
        let find4 = ToggleCommand(text: "Search subdirectories", prefix: "", checkedCommand: "", uncheckedCommand: "-maxdepth 1", value: false)
        let find5 = TextCommand(text: "Onwer username", prefix: "-user ", placeHolder: "", isNumeric: false, value: "")
        
        let find = Command(friendlyName: "Find files by attribute", rootCommand: "find ", mustBeFirst: true, options: [find1, find2, find3, find4, find5])
        
        commands.append(ps)
        commands.append(less)
        commands.append(count)
        commands.append(find)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commands.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let cmd = commands[indexPath.row]
        
        cell.textLabel?.text = cmd.friendlyName
        cell.detailTextLabel?.text = cmd.summary
        
        if cmd.mustBeFirst {
            cell.textLabel?.textColor = .blue
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cmd = commands[indexPath.row]
        terminalViewController.addCommand(cmd)
        
        if cmd.options.isEmpty {
            navigationController?.popToRootViewController(animated: true)
        } else {
            let vc = EditCommandViewController(style: .grouped)
            vc.activeCommand = cmd
            
            if let first = navigationController?.viewControllers.first {
                navigationController?.setViewControllers([first, vc], animated: true)
            }
        }
    }
}
