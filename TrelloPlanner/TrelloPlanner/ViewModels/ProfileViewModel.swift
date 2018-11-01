//
//  ProfileViewModel.swift
//  TrelloPlanner
//
//  Created by Robert Kuraj on 01/11/2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation
import RxSwift

class ProfileViewModel {
    var avatarImage = Variable<UIImage>(UIImage())
    
    private var dialogService: DialogServiceProtocol
    private var memberRepository: MemberRepositoryProtocol
    
    required init(_ dialogService: DialogServiceProtocol, _ memberRepository: MemberRepositoryProtocol) {
        self.dialogService = dialogService
        self.memberRepository = memberRepository
    }
    
    public func fetchData() {
        self.memberRepository.getMember().subscribe { event in
            if let error = event.error {
                Logger.Log(error.localizedDescription)
                return
            }
            
            guard let member = event.element else {
                return
            }
            
            self.setAvatarImage(from: member.avatarUrl)
            
        }
    }
    
    private func setAvatarImage(from ulr: String?) {
        self.memberRepository.getAvatar(from: ulr).subscribe { event in
            if let error = event.error {
                Logger.Log(error.localizedDescription)
                return
            }
            
            guard let image = event.element else {
                return
            }
            
            self.avatarImage.value = image
        }
    }
}
