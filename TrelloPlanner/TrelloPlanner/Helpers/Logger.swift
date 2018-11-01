//
//  Logger.swift
//  TrelloPlanner
//
//  Created by Robert Kuraj on 25/10/2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation

class Logger {
    static func Log(_ message: String) {
        #if DEBUG
        print(message)
        #endif
    }
}
