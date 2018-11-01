//
//  ViewController.swift
//  TrelloPlanner
//
//  Created by Robert Kuraj on 01/11/2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

open class ViewController: UIViewController {
    var disposeBag: DisposeBag!
    func createViewModel() {}
    func createBindingSet() {}
    func setControlsBehavior() {}
    
    override open func viewDidLoad() {
        disposeBag = DisposeBag()
        createViewModel()
        createBindingSet()
        setControlsBehavior()
    }
}
