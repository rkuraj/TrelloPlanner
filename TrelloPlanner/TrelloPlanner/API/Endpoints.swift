//
//  Endpoints.swift
//  TrelloPlanner
//
//  Created by Robert Kuraj on 25/10/2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation


//TODO



private let baseUrl = "https://api.trello.com"
private let apiKey = "6f44c5e0f9001078c4d7ae8439f20862"
private let token = "e5b976fc825eeabeddd3655c473b42a537fd2485a297c6f91c85b28844edcf63"
private let userName = "robertkuraj"

enum Endpoints {
    case boards
    case member
    
    func path() -> String {
        switch self {
        case .boards:
            return baseUrl + "/1/boards"
//            return "https://api.trello.com/1/boards/?name=name&key=6f44c5e0f9001078c4d7ae8439f20862&token=e5b976fc825eeabeddd3655c473b42a537fd2485a297c6f91c85b28844edcf63"
            
        case .member:
            return baseUrl + "/1/members/\(userName)?key=\(apiKey)&token=\(token)"
        }
        
        
    }
}
