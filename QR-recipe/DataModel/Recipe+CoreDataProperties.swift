//
//  Recipe+CoreDataProperties.swift
//  QR-recipe
//
//  Created by Vitalii Havryliuk on 5/14/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var doctorID: Int32
    @NSManaged public var recipeID: Int32
    @NSManaged public var patient: Patients?
    @NSManaged public var hasMedicines: [RecipeHasMedicines]

}

// MARK: Generated accessors for hasMedicines
extension Recipe {

    @objc(addHasMedicinesObject:)
    @NSManaged public func addToHasMedicines(_ value: RecipeHasMedicines)

    @objc(removeHasMedicinesObject:)
    @NSManaged public func removeFromHasMedicines(_ value: RecipeHasMedicines)

    @objc(addHasMedicines:)
    @NSManaged public func addToHasMedicines(_ values: [RecipeHasMedicines])

    @objc(removeHasMedicines:)
    @NSManaged public func removeFromHasMedicines(_ values: [RecipeHasMedicines])

}
