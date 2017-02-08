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
    
    var datePicker = UIDatePicker()
    var date = String()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        UINib(nibName: "TextFieldView", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        textField.underlined(color: UIColor.black)
        textField.delegate = self
        
        datePicker.datePickerMode = .date
        textField.inputView = datePicker
        
        let toolbar = UIToolbar()
        textField.inputAccessoryView = toolbar
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.clickDone))
        

        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.inputAccessoryView = toolBar
        
    }
    
    func clickDone() {
        self.view.endEditing(true)
        textField.text = getDateFromPicker()
    }
    
    func getDateFromPicker() -> String {
        let dateFormatter = DateFormatter()
        let currentDate = datePicker.date
        dateFormatter.dateFormat = "dd.MM.yyyy"
        date = dateFormatter.string(from: currentDate)
        return date
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
