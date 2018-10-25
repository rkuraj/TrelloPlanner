//
//  Injector.swift
//  TrelloPlanner
//
//  Created by Robert Kuraj on 25/10/2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation
import Swinject

class Injector {
    private var container = Container()
    
    public func resolve<T>(_ serviceType: T.Type) -> T? {
        return container.resolve(serviceType)
    }
    
    public func registerDependency() {
        container.removeAll()
    }
    
    public static func shared() -> Injector {
        return self.instance
    }
    
    private static var instance: Injector = {
        return Injector()
    }()
}
