//
//  BoardRepositoryProtocol.swift
//  TrelloPlanner
//
//  Created by Robert Kuraj on 29/10/2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation
import RxSwift

public protocol BoardRepositoryProtocol {
    func getBoards() -> Observable<BoardsModel>
}
