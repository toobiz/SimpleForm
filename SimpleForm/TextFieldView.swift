//
//  TextFieldView.swift
//  SimpleForm
//
//  Created by Michał Tubis on 07.02.2017.
//  Copyright © 2017 Mike Tubis. All rights reserved.
//

import UIKit

class TextFieldView: UIView, UITextFieldDelegate {

    @IBOutlet var view: UIView!
    @IBOutlet var textField: UITextField!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        UINib(nibName: "TextFieldView", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        textField.underlined()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("typing...")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    


}
