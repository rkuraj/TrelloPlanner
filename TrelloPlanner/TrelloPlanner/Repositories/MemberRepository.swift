//
//  MemberRepository.swift
//  TrelloPlanner
//
//  Created by Robert Kuraj on 31/10/2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation
import RxSwift

public class MemberRepository: MemberRepositoryProtocol {
    let apiService: ApiServiceProtocol
    
    init(apiService: ApiServiceProtocol) {
        self.apiService = apiService
    }
    
    public func getMember() -> Observable<MemberModel> {
        return apiService.getMember().flatMap { any -> Observable<MemberModel> in
            let jsonDecoder = JSONDecoder()
            let member = try jsonDecoder.decode(MemberModel.self, from: any)
            return Observable.create { subscriber in
                subscriber.onNext(member)
                subscriber.onCompleted()
                return Disposables.create()
            }
        }
    }
}
