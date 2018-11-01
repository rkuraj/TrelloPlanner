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
        container.register(DialogServiceProtocol.self) {
            _ in DialogService()
        }
        container.register(ApiServiceProtocol.self) {
            _ in ApiService()
        }
        
        let apiService: ApiServiceProtocol = Injector.shared().resolve(ApiServiceProtocol.self)!
        
        container.register(BoardRepositoryProtocol.self) {
            _ in BoardRepository(apiService: apiService)
        }
        
        container.register(MemberRepositoryProtocol.self) {
            _ in MemberRepository(apiService: apiService)
        }
    }
    
    public static func shared() -> Injector {
        return self.instance
    }
    
    private static var instance: Injector = {
        return Injector()
    }()
    
    private init() {}
}
