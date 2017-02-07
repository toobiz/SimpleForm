//
//  CheckboxView.swift
//  SimpleForm
//
//  Created by Michał Tubis on 07.02.2017.
//  Copyright © 2017 Mike Tubis. All rights reserved.
//

import UIKit

class CheckboxView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet var button: UIButton!
    @IBOutlet var label: UILabel!
    
    var selected = false
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        UINib(nibName: "CheckboxView", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds

    }
    @IBAction func checkboxTapped(_ sender: Any) {
        if selected == false {
            button.setImage(UIImage.init(named: "checkbox-full"), for: .normal)
            selected = true
        } else {
            button.setImage(UIImage.init(named: "checkbox-empty"), for: .normal)
            selected = false
        }
    }
}
