//
//  TextCommand.swift
//  TerminalTableView
//
//  Created by Prudhvi Gadiraju on 5/31/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import Foundation

class TextCommand: CommandOption {
    var text: String
    var prefix: String
    var placeHolder: String
    var isNumeric: Bool
    var value: String
    
    init(text: String, prefix: String, placeHolder: String, isNumeric: Bool, value: String) {
        self.text = text
        self.prefix = prefix
        self.placeHolder = placeHolder
        self.isNumeric = isNumeric
        self.value = value
    }
}
