//
//  MemberRepositoryProtocol.swift
//  TrelloPlanner
//
//  Created by Robert Kuraj on 31/10/2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation
import RxSwift

public protocol MemberRepositoryProtocol {
    func getMember() -> Observable<MemberModel>
}
