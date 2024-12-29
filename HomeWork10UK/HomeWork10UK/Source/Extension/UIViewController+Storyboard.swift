//
//  UIViewController+Storyboard.swift
//  HomeWork10UK
//
//  Created by user on 20.12.2024.
//

import UIKit

extension UIViewController {
    
    static func fromMainStoryboard() -> UIViewController? {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: self.storyboardIdentifier)
        
        return vc
    }
    
    static var storyboardIdentifier: String {
        get {
            return String(describing: self)
        }
    }
}
