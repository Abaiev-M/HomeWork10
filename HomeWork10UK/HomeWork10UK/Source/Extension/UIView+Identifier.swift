//
//  UIView+Identifier.swift
//  HomeWork10UK
//
//  Created by user on 20.12.2024.
//

import UIKit

extension UIView {
    
    var reuseIdentifier: String {
        get {
            return String(describing: self)
        }
    }
}
