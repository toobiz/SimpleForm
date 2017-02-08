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
    @IBOutlet var firstCheckboxView: CheckboxView!
    @IBOutlet var secondCheckboxView: CheckboxView!
    
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
        
        firstCheckboxView.label.text = "Wyrażam zgodę na otrzymywanie od firmy ABCDE Polska Sp. z o.o. ABCDE Polska Dystrybucja Sp. z o.o. oraz ABCDE PLC. informacji handlowych i naukowych drogą elektroniczną na wskazany powyżej adres email."
        secondCheckboxView.label.text = "Wyrażam zgodę na przetwarzanie swoich danych osobowych, zgodnie z ustawą z dnia 29 sierpnia 1997r. o ochronie danych osobowych (tekst jednolity z dnia 17.06.2002r. Dz. U. Nr 101 poz. 926, z późn. zm.) w celach reklamowych i marketingowych przez firmę ABCDE Polska Sp. z o.o. oraz ABCDE Polska Dystrybucja Sp. z o.o."
    }

    @IBAction func saveData(_ sender: Any) {
        
        print("Imię: \(nameView.textField.text)")
        print("Nazwisko: \(lastNameView.textField.text)")
        print("Stanowisko: \(jobView.textField.text)")
        print("Firma: \(companyView.textField.text)")
        print("Adres e-mail: \(addressView.textField.text)")
        print("Telefon: \(phoneView.textField.text)")
        print("Data spotkania: \(dateView.textField.text)")
        print("Marketing: \(firstCheckboxView.selected)")
        print("Przetwarzanie danych: \(secondCheckboxView.selected)")

    }

}

