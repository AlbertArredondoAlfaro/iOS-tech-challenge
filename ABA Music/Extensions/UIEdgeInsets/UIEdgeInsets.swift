//
//  UIEdgeInsets.swift
//  ABA Music
//
//  Created by Ricardo Casanova on 21/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import Foundation

extension UIEdgeInsets {
    
    static var safeAreaInsets: UIEdgeInsets = {
        guard let window = (UIApplication.shared.delegate as? AppDelegate)?.window else { return UIEdgeInsets.zero }
        let insets: UIEdgeInsets
        if #available(iOS 11.0, *) {
            insets = window.safeAreaInsets
        } else {
            insets = UIEdgeInsets.zero
        }
        return insets
    }()
    
}
