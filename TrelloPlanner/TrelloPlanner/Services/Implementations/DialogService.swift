//
//  DialogService.swift
//  TrelloPlanner
//
//  Created by Robert Kuraj on 25/10/2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation
import MBProgressHUD
import UIKit

public class DialogService: DialogServiceProtocol {
    private var progressHUD: MBProgressHUD?
    
    public func ShowProgressHud() {
        guard let topViewController = ControllerHelper.topViewController() else {
            return
        }
        
        self.progressHUD?.hide(animated: true)
        self.progressHUD = MBProgressHUD.showAdded(to: topViewController.view, animated: true)
        self.progressHUD?.label.text = Translations.ProgressDialogTitle
    }
    
    public func HideProgressHud() {
        self.progressHUD?.hide(animated: true)
    }
    
    public func ShowAlert(title: String, message: String) {
        guard let topViewController = ControllerHelper.topViewController() else {
            return
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Translations.AlertDialogOk.localized(), style: .default, handler: nil))
        topViewController.present(alert, animated: true, completion: nil)
    }
    
    public func ShowAlert(title: String, message: String, completion: ((UIAlertAction) -> Swift.Void)? = nil) {
        guard let topViewController = ControllerHelper.topViewController() else {
            return
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Translations.AlertDialogYes.localized(), style: .default, handler: completion))
        alert.addAction(UIAlertAction(title: Translations.AlertDialogNo.localized(), style: .cancel, handler: nil))
        
        topViewController.present(alert, animated: true, completion: nil)
    }
}
