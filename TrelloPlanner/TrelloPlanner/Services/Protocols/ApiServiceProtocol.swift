//
//  ApiServiceProtocol.swift
//  TrelloPlanner
//
//  Created by Robert Kuraj on 25/10/2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation
import RxSwift

public protocol ApiServiceProtocol {
    func getBoards() -> Observable<Data>
    func getMember() -> Observable<Data>
}
