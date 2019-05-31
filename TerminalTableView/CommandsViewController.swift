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
        
        let ps = Command(friendlyName: "Show all processes", rootCommand: "ps aux", mustBeFirst: true)
        let less = Command(friendlyName: "Use Scroll View", rootCommand: "less", mustBeFirst: false)
        
        commands.append(ps)
        commands.append(less)
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
        navigationController?.popToRootViewController(animated: true)
    }
}
