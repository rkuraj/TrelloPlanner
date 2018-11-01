//
//  MainViewModel.swift
//  TrelloPlanner
//
//  Created by Robert Kuraj on 29/10/2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation
import RxSwift

class MainViewModel {
    //MARK: Properties
    let result = Variable<String>("")
    
    private var dialogService: DialogServiceProtocol
    private var boardRepository: BoardRepositoryProtocol
    private var memberRepository: MemberRepositoryProtocol
    
    required init(_ dialogService: DialogServiceProtocol, _ boardRepository: BoardRepositoryProtocol, _ memberRepository: MemberRepositoryProtocol) {
        self.dialogService = dialogService
        self.boardRepository = boardRepository
        self.memberRepository = memberRepository
    }
    
    public func fetchData() {
        
        _ = self.memberRepository.getMember().subscribe { event in
            if let error = event.error {
                Logger.Log(error.localizedDescription)
                return
            }
            
            guard let member = event.element else {
                return
            }
            
            guard let email = member.email else {
                return
            }
            
            self.result.value = email
        }
//        _ = self.boardRepository.getBoards().subscribe { event in
//            if let error = event.error {
//                Logger.Log(error.localizedDescription)
//            }
//            guard let boards = event.element else {
//                return
//            }
//
//            guard let name = boards.items.first?.name else {
//                return
//            }
//
//            self.result.value = name
//        }
    }
}
