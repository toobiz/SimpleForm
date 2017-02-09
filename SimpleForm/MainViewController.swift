//
//  ViewController.swift
//  SimpleForm
//
//  Created by Michał Tubis on 06.02.2017.
//  Copyright © 2017 Mike Tubis. All rights reserved.
//

import UIKit
import CoreData

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
    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    var forms = [Form]()
    var keyboardAppeared = false
    
    lazy var sharedContext: NSManagedObjectContext =  {
        return CoreDataStackManager.sharedInstance().managedObjectContext
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetup()
        addObservers()
        fillWithStaticData()
        
        forms = fetchForms()
        if forms.count > 0 {
            fillWithSavedData()
        }
        

    }

    // MARK: - Saving / fetching data
    
    func fillWithStaticData() {
        
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
    
    func fillWithSavedData() {
        
        let form = forms[forms.endIndex - 1]
        
        nameView.textField.text = form.value(forKey: "name") as? String
        lastNameView.textField.text = form.value(forKey: "lastName") as? String
        jobView.textField.text = form.value(forKey: "job") as? String
        companyView.textField.text = form.value(forKey: "company") as? String
        addressView.textField.text = form.value(forKey: "address") as? String
        phoneView.textField.text = form.value(forKey: "phone") as? String
        dateView.textField.text = form.value(forKey: "date") as? String
        
        if (form.value(forKey: "marketing") as! Bool == true) {
            firstCheckboxView.select()
        } else {
            firstCheckboxView.deselect()
        }
        
        if (form.value(forKey: "processing") as! Bool == true) {
            secondCheckboxView.select()
        } else {
            secondCheckboxView.deselect()
        }
        
    }
    
    @IBAction func saveData(_ sender: Any) {
        
        forms = fetchForms()
        if forms.count > 0 {
            let form = forms[forms.endIndex - 1]
            sharedContext.delete(form)
            CoreDataStackManager.sharedInstance().saveContext()
        }

        print("Imię: \(nameView.textField.text)")
        print("Nazwisko: \(lastNameView.textField.text)")
        print("Stanowisko: \(jobView.textField.text)")
        print("Firma: \(companyView.textField.text)")
        print("Adres e-mail: \(addressView.textField.text)")
        print("Telefon: \(phoneView.textField.text)")
        print("Data spotkania: \(dateView.textField.text)")
        print("Marketing: \(firstCheckboxView.selected)")
        print("Przetwarzanie danych: \(secondCheckboxView.selected)")
        
        let dictionary : [String : AnyObject] = [
            "user_address" : addressView.textField.text! as AnyObject,
            "company_name" :   companyView.textField.text! as AnyObject,
            "meeting_date" : dateView.textField.text! as AnyObject,
            "job_title" : jobView.textField.text! as AnyObject,
            "last_name" : lastNameView.textField.text! as AnyObject,
            "marketing_permission" : firstCheckboxView.selected as AnyObject,
            "user_name" : nameView.textField.text! as AnyObject,
            "phone_number" : phoneView.textField.text! as AnyObject,
            "processing_permission" : secondCheckboxView.selected as AnyObject
        ]
        
        let _  = Form(dictionary: dictionary, context: sharedContext)
        CoreDataStackManager.sharedInstance().saveContext()
        showAlert()
    }
    
    func fetchForms() -> [Form] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Form")
        
        do {
            return try sharedContext.fetch(fetchRequest) as! [Form]
        } catch  let error as NSError {
            print("Error in fetchForms(): \(error)")
            return [Form()]
        }
    }
    
    // MARK: - Keyboard
    
    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if keyboardAppeared == false {
                bottomConstraint.constant += keyboardSize.height
                keyboardAppeared = true
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
            if keyboardAppeared == true {
                bottomConstraint.constant = 451
                keyboardAppeared = false
                view.endEditing(true)
        }
    }
    
    // MARK: - Helpers
    
    func initialSetup() {
        title = "Dane osobowe"
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15, weight: UIFontWeightRegular)]
        saveButton.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 15, weight: UIFontWeightLight)], for: .normal)
    }
    
    func showAlert() {
    let alert = UIAlertController(title: "Zapisano", message: "", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    present(alert, animated: true, completion: nil)
    }
}


