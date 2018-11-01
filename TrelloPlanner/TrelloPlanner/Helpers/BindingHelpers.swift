//
//  BindingHelpers.swift
//  TrelloPlanner
//
//  Created by Robert Kuraj on 01/11/2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation
import RxSwift
import UIKit
import RxCocoa

extension Reactive where Base: UIImageView {
    public var image: Binder<UIImage?> {
        return Binder(base) { imageView, image in
            imageView.image = image
        }
    }
}
