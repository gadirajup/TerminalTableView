//
//  CommandOption.swift
//  TerminalTableView
//
//  Created by Prudhvi Gadiraju on 5/31/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import Foundation

protocol CommandOption {
    var text: String { get }
    var prefix: String { get }
}
