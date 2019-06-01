//
//  ToggleCommand.swift
//  TerminalTableView
//
//  Created by Prudhvi Gadiraju on 5/31/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import Foundation

class ToggleCommand: CommandOption {
    var text: String
    var prefix: String
    var checkedCommand: String
    var uncheckedCommand: String
    var value: Bool
    
    init(text: String, prefix: String, checkedCommand: String, uncheckedCommand: String, value: Bool) {
        self.text = text
        self.prefix = prefix
        self.checkedCommand = checkedCommand
        self.uncheckedCommand = uncheckedCommand
        self.value = value
    }
}
