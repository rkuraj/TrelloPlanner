//
//  BoardRepository.swift
//  TrelloPlanner
//
//  Created by Robert Kuraj on 29/10/2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation
import RxSwift

class BoardRepository: BoardRepositoryProtocol {
    let apiService: ApiServiceProtocol
    
    init(apiService: ApiServiceProtocol) {
        self.apiService = apiService
    }
    
    func getBoards() -> Observable<BoardsModel> {
        return apiService.getBoards().flatMap { any -> Observable<BoardsModel> in
            let jsonDecoder = JSONDecoder()
            let boards = try jsonDecoder.decode(BoardsModel.self, from: any)
            return Observable.create { subscriber in
                subscriber.onNext(boards)
                subscriber.onCompleted()
                return Disposables.create()
            }
            
        }
    }
    
}
