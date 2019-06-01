//
//  CommandCell.swift
//  TerminalTableView
//
//  Created by Prudhvi Gadiraju on 5/31/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class CommandCell: UITableViewCell {
    let toggle = UISwitch()
    var switchChangedAction: ((Bool) -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        selectionStyle = .none
        toggle.addTarget(self, action: #selector(handleToggleSwitch), for: .valueChanged)
        toggle.sizeToFit()
        accessoryView = toggle
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleToggleSwitch(sender: UISwitch) {
        switchChangedAction?(sender.isOn)
    }
}
