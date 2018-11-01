//
//  ApiService.swift
//  TrelloPlanner
//
//  Created by Robert Kuraj on 25/10/2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import RxAlamofire

public class ApiService: ApiServiceProtocol {
    let sessionManager = SessionManager.default
    
    public func getBoards() -> Observable<Data> {
        return sessionManager.rx.data(.post, Endpoints.boards.path(), parameters: nil, encoding: URLEncoding.default, headers: nil)
    }
    
    public func getMember() -> Observable<Data> {
        return sessionManager.rx.data(.get, Endpoints.member.path(), parameters: nil, encoding: URLEncoding.default, headers: nil)
    }
    
    public func getAvatar(_ url:String) -> Observable<Data> {
        return sessionManager.rx.data(.connect, url)
    }
}
