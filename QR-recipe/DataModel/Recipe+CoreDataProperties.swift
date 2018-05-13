//
//  Recipe+CoreDataProperties.swift
//  QR-recipe
//
//  Created by Vitalii Havryliuk on 5/13/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var instruction: String
    @NSManaged public var patient: Patients
    @NSManaged public var medicine: Medicines

}
