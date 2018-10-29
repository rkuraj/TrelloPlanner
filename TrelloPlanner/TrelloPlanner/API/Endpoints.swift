//
//  Endpoints.swift
//  TrelloPlanner
//
//  Created by Robert Kuraj on 25/10/2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation
//
//private static let apiKey = "6f44c5e0f9001078c4d7ae8439f20862"
////TODO
//private static let token = "e5b976fc825eeabeddd3655c473b42a537fd2485a297c6f91c85b28844edcf63"


private let BASE_URL = "https://api.trello.com"

enum Endpoints {
    case boards
    
    func path() -> String {
        switch self {
        case .boards:
            return BASE_URL + "/1/boards/"
        }
    }
}
