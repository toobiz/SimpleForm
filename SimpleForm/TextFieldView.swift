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
    @IBOutlet var label: UILabel!
    @IBOutlet var textField: UITextField!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        UINib(nibName: "TextFieldView", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        textField.underlined(color: UIColor.black)
        textField.delegate = self
        
        let datePicker = UIDatePicker()
        textField.inputView = datePicker
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let highlightedColor = UIColor.init(red: 55/255.0, green: 228/255.0, blue: 150/255.0, alpha: 1.0)
        label.textColor = highlightedColor
        textField.underlined(color: highlightedColor)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        returnToBlack()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        returnToBlack()
    }
    
    func returnToBlack() {
        textField.resignFirstResponder()
        label.textColor = UIColor.black
        textField.underlined(color: UIColor.black)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
