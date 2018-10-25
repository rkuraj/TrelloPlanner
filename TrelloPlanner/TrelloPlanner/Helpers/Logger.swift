//
//  Logger.swift
//  TrelloPlanner
//
//  Created by Robert Kuraj on 25/10/2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation
import SwiftyBeaver

class Logger {
    private let logger = SwiftyBeaver.self
    private let console = ConsoleDestination()
    
    public func Log(message: String) {
        #if DEBUG
        logger.addDestination(console)
        logger.verbose(message)
        #endif
    }
    
    public func Error(message: String) {
        #if DEBUG
        logger.addDestination(console)
        logger.error(message)
        #endif
    }
}
