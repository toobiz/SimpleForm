//
//  TextFieldDateView.swift
//  SimpleForm
//
//  Created by Michał Tubis on 08.02.2017.
//  Copyright © 2017 Mike Tubis. All rights reserved.
//

import UIKit

class TextFieldDateView: TextFieldView {
    
    var datePicker = UIDatePicker()
    var date = String()

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        datePicker.datePickerMode = .date
        textField.inputView = datePicker
        textField.placeholder = "Wybierz datę"
        
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
        
        let imageView = UIImageView();
        let image = UIImage(named: "checkbox-empty");
        imageView.image = image;
        imageView.frame = CGRect(x: 120, y: 10, width: 20, height: 20)
        textField.addSubview(imageView)
        let rightView = UIView.init(frame: CGRect(x: 0, y: 5, width: textField.frame.size.width-235, height: textField.frame.size.height))
        textField.rightView = rightView;
        textField.rightViewMode = UITextFieldViewMode.always
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
}
