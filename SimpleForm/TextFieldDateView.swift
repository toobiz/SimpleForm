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
        
        setupPicker()
        setupToolBar()
        setupArrowButton()
    }
    
    // MARK: - Initial setup
    
    func setupPicker() {
        datePicker.datePickerMode = .date
        textField.inputView = datePicker
        textField.placeholder = "Wybierz datę"
    }
    
    func setupToolBar() {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Gotowe", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.clickDone))
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        textField.inputAccessoryView = toolBar
        textField.tintColor = UIColor.clear
    }
    
    func setupArrowButton() {
        let arrowButton = UIButton(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        arrowButton.setImage(UIImage(named: "arrow"), for: .normal)
        textField.rightView = arrowButton
        arrowButton.addTarget(self, action: #selector(self.clickArrow), for: UIControlEvents.touchUpInside)
        textField.rightViewMode = UITextFieldViewMode.always
    }
    
    // MARK: - Actions
    
    func clickArrow() {
        textField.becomeFirstResponder()
    }

    func clickDone() {
        self.view.endEditing(true)
        textField.text = getDateFromPicker()
    }
    
    // MARK: - Date Picker
    
    func getDateFromPicker() -> String {
        let dateFormatter = DateFormatter()
        let currentDate = datePicker.date
        dateFormatter.dateFormat = "dd.MM.yyyy"
        date = dateFormatter.string(from: currentDate)
        return date
    }
}
