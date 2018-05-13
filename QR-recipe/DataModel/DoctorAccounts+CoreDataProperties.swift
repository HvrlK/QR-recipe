//
//  DoctorAccounts+CoreDataProperties.swift
//  QR-recipe
//
//  Created by Vitalii Havryliuk on 5/13/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//
//

import Foundation
import CoreData


extension DoctorAccounts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DoctorAccounts> {
        return NSFetchRequest<DoctorAccounts>(entityName: "DoctorAccounts")
    }

    @NSManaged public var login: String
    @NSManaged public var password: String
    @NSManaged public var doctor: Doctors

}
