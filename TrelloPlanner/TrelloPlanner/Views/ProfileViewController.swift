//
//  ProfileViewController.swift
//  TrelloPlanner
//
//  Created by Robert Kuraj on 01/11/2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import UIKit

class ProfileViewController: ViewController {
    
    //MARK: Properties
    private var viewModel: ProfileViewModel?
    
    //MARK: Outlets
    @IBOutlet weak var avatarImageView: UIImageView!
    
    //MARK: Actions
    @IBAction func fetchAvatar(_ sender: UIButton) {
        self.viewModel?.fetchData()
    }
    
    //MARK: Overrides
    override func createViewModel() {
        let dialogService = Injector.shared().resolve(DialogServiceProtocol.self)!
        
        let memberRepository = Injector.shared().resolve(MemberRepositoryProtocol.self)!
        
        self.viewModel = ProfileViewModel(dialogService, memberRepository)
    }
    
    override func setControlsBehavior() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
    }
    
    override func createBindingSet() {
        self.viewModel?.avatarImage.asObservable()
            .map { $0 }
            .bind(to: self.avatarImageView.rx.image)
            .disposed(by: self.disposeBag)
    }
}
