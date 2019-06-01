//
//  SelectCommand.swift
//  TerminalTableView
//
//  Created by Prudhvi Gadiraju on 5/31/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import Foundation

class SelectCommand: CommandOption {
    var text: String
    var prefix: String
    var value: String
    var friendlyValues: [String]
    var actualValues: [String]
    
    init(text: String, prefix: String, value: String, friendlyValues: [String], actualValues: [String]) {
        self.text = text
        self.prefix = prefix
        self.value = value
        self.friendlyValues = friendlyValues
        self.actualValues = actualValues
    }
}
