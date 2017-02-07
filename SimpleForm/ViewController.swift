//
//  ViewController.swift
//  SimpleForm
//
//  Created by Michał Tubis on 06.02.2017.
//  Copyright © 2017 Mike Tubis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var nameView: TextFieldView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "Dane osobowe"

    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("editing")
    }
    
    override func viewDidLayoutSubviews() {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

