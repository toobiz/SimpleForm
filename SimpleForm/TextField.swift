//
//  TextField.swift
//  SimpleForm
//
//  Created by Michał Tubis on 07.02.2017.
//  Copyright © 2017 Mike Tubis. All rights reserved.
//

import UIKit

extension UITextField {
    
    func underlined(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width - 20, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
