//
//  MainViewController.swift
//  TrelloPlanner
//
//  Created by Robert Kuraj on 25/10/2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {

    //MARK: Properties
    private var viewModel: MainViewModel?
    private var disposeBag: DisposeBag!
    
    //MARK: Outlets
    @IBOutlet weak var fetchDataButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    //MARK: Actions
    
    @IBAction func fetchButtonTapped(_ sender: UIButton) {
        viewModel?.fetchData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = MainViewModel()
        self.disposeBag = DisposeBag()
        
        createBindingSet()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func createBindingSet() {
        viewModel?.result.asObservable()
        .map{ $0}
        .bind(to: resultLabel.rx.text)
            .disposed(by: self.disposeBag)
    }
}
