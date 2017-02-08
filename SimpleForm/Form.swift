//
//  Form.swift
//  SimpleForm
//
//  Created by Michał Tubis on 08.02.2017.
//  Copyright © 2017 Mike Tubis. All rights reserved.
//

import Foundation
import UIKit
import CoreData

@objc (Form)
class Form: NSManagedObject {
    
    struct Keys {
        static let address = "user_address"
        static let company = "company_name"
        static let date = "meeting_date"
        static let job = "job_title"
    }
    
    @NSManaged var address: String
    @NSManaged var company: String
    @NSManaged var date: String
    @NSManaged var job: String
    
    override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    init(dictionary: [String: String], context: NSManagedObjectContext) {
        let entity =  NSEntityDescription.entity(forEntityName: "Form", in: context)!
        super.init(entity: entity, insertInto: context)
        
        if let user_address = dictionary[Keys.address] {
            address = user_address
        }
        
        if let company_name = dictionary[Keys.date] {
            company = company_name
        }
        
        if let meeting_date = dictionary[Keys.date] {
            date = meeting_date
        }
        
        if let job_title = dictionary[Keys.job] {
            job = job_title
        }
        
    }
    
}
