//
//  DialogServiceProtocol.swift
//  TrelloPlanner
//
//  Created by Robert Kuraj on 25/10/2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation
import UIKit

public protocol DialogServiceProtocol {
    func showProgressHud()
    func hideProgressHud()
    func showAlert(title: String, message: String)
    func showAlert(title: String, message: String, completion: ((UIAlertAction) -> Swift.Void)?)
}
