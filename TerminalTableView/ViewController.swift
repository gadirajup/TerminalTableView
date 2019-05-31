//
//  ViewController.swift
//  TerminalTableView
//
//  Created by Prudhvi Gadiraju on 5/30/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var commands = [Command]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var output: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAdd))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @objc func handleAdd() {
        let vc = CommandsViewController()
        vc.terminalViewController = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func addCommand(_ command: Command) {
        commands.append(command)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commands.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let cmd = commands[indexPath.row]
        
        cell.textLabel?.text = cmd.friendlyName
        cell.detailTextLabel?.text = cmd.summary
        
        if cmd.mustBeFirst {
            cell.textLabel?.textColor = .blue
        }
        
        return cell
    }
}

