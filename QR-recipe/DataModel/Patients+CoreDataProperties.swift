//
//  Patients+CoreDataProperties.swift
//  QR-recipe
//
//  Created by Vitalii Havryliuk on 5/14/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//
//

import Foundation
import CoreData


extension Patients {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Patients> {
        return NSFetchRequest<Patients>(entityName: "Patients")
    }

    @NSManaged public var birthDate: String
    @NSManaged public var name: String
    @NSManaged public var medicalID: Int32
    @NSManaged public var surname: String
    @NSManaged public var account: PatientAccounts
    @NSManaged public var doctor: Doctors?
    @NSManaged public var recipe: Recipe?

}
