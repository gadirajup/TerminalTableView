//
//  Command.swift
//  TerminalTableView
//
//  Created by Prudhvi Gadiraju on 5/30/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import Foundation

struct Command {
    var friendlyName: String
    var rootCommand: String
    var mustBeFirst: Bool
    var options: [CommandOption]
    
    var summary: String {
        return "Summary here :)"
    }
}
