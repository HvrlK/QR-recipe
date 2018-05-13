//
//  Doctors+CoreDataProperties.swift
//  QR-recipe
//
//  Created by Vitalii Havryliuk on 5/13/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//
//

import Foundation
import CoreData


extension Doctors {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Doctors> {
        return NSFetchRequest<Doctors>(entityName: "Doctors")
    }

    @NSManaged public var doctorID: Int32
    @NSManaged public var name: String
    @NSManaged public var surname: String
    @NSManaged public var birthDate: NSDate?
    @NSManaged public var position: String?
    @NSManaged public var account: DoctorAccounts
    @NSManaged public var patients: [Patients]

}

// MARK: Generated accessors for patients
extension Doctors {

    @objc(addPatientsObject:)
    @NSManaged public func addToPatients(_ value: Patients)

    @objc(removePatientsObject:)
    @NSManaged public func removeFromPatients(_ value: Patients)

    @objc(addPatients:)
    @NSManaged public func addToPatients(_ values: [Patients])

    @objc(removePatients:)
    @NSManaged public func removeFromPatients(_ values: [Patients])

}
