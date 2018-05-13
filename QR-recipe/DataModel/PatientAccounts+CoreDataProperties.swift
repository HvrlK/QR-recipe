//
//  PatientAccounts+CoreDataProperties.swift
//  QR-recipe
//
//  Created by Vitalii Havryliuk on 5/13/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//
//

import Foundation
import CoreData


extension PatientAccounts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PatientAccounts> {
        return NSFetchRequest<PatientAccounts>(entityName: "PatientAccounts")
    }

    @NSManaged public var login: String
    @NSManaged public var password: String
    @NSManaged public var patient: Patients

}
