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
        static let lastName = "last_name"
        static let marketing = "marketing_permission"
        static let name = "user_name"
        static let phone = "phone_number"
        static let processing = "processing_permission"
    }
    
    @NSManaged var address: String
    @NSManaged var company: String
    @NSManaged var date: String
    @NSManaged var job: String
    @NSManaged var lastName: String
    @NSManaged var marketing: Bool
    @NSManaged var name: String
    @NSManaged var phone: String
    @NSManaged var processing: Bool
    
    override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    init(dictionary: [String: AnyObject], context: NSManagedObjectContext) {
        let entity =  NSEntityDescription.entity(forEntityName: "Form", in: context)!
        super.init(entity: entity, insertInto: context)
        
        if let user_address = dictionary[Keys.address] {
            address = user_address as! String
        }
        
        if let company_name = dictionary[Keys.company] {
            company = company_name as! String
        }
        
        if let meeting_date = dictionary[Keys.date] {
            date = meeting_date as! String
        }
        
        if let job_title = dictionary[Keys.job] {
            job = job_title as! String
        }
        
        if let last_name = dictionary[Keys.lastName] {
            lastName = last_name as! String
        }
        
        if let marketing_permission = dictionary[Keys.marketing] {
            marketing = marketing_permission as! Bool
        }
        
        if let user_name = dictionary[Keys.name] {
            name = user_name as! String
        }
        
        if let phone_number = dictionary[Keys.phone] {
            phone = phone_number as! String
        }
        
        if let processing_permission = dictionary[Keys.processing] {
            processing = processing_permission as! Bool
        }
    }
    
}
