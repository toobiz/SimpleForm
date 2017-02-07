//
//  ViewController.swift
//  SimpleForm
//
//  Created by Michał Tubis on 06.02.2017.
//  Copyright © 2017 Mike Tubis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameView: TextFieldView!
    @IBOutlet var lastNameView: TextFieldView!
    @IBOutlet var jobView: TextFieldView!
    @IBOutlet var companyView: TextFieldView!
    @IBOutlet var addressView: TextFieldView!
    @IBOutlet var phoneView: TextFieldView!
    @IBOutlet var dateView: TextFieldView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Dane osobowe"
        nameView.label.text = "Imię"
        lastNameView.label.text = "Nazwisko"
        jobView.label.text = "Stanowisko"
        companyView.label.text = "Firma"
        addressView.label.text = "Adres e-mail"
        phoneView.label.text = "Telefon"
        dateView.label.text = "Data spotkania"
        dateView.textField.placeholder = "Wybierz datę"
    }
    
    override func viewDidLayoutSubviews() {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

