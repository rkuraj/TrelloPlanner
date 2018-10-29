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
    
    required init() {
        self.dialogService = Injector.shared().resolve(DialogServiceProtocol.self)!
    }
    
    public func fetchData() {
        result.value = "fetched"
        self.dialogService.showAlert(title: "elo", message: "elo")
    }
}
