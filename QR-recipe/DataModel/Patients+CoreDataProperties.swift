//
//  Patients+CoreDataProperties.swift
//  QR-recipe
//
//  Created by Vitalii Havryliuk on 5/13/18.
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
    @NSManaged public var recipe: NSSet?

}

// MARK: Generated accessors for recipe
extension Patients {

    @objc(addRecipeObject:)
    @NSManaged public func addToRecipe(_ value: Recipe)

    @objc(removeRecipeObject:)
    @NSManaged public func removeFromRecipe(_ value: Recipe)

    @objc(addRecipe:)
    @NSManaged public func addToRecipe(_ values: NSSet)

    @objc(removeRecipe:)
    @NSManaged public func removeFromRecipe(_ values: NSSet)

}
