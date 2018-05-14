//
//  Medicines+CoreDataProperties.swift
//  QR-recipe
//
//  Created by Vitalii Havryliuk on 5/14/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//
//

import Foundation
import CoreData


extension Medicines {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Medicines> {
        return NSFetchRequest<Medicines>(entityName: "Medicines")
    }

    @NSManaged public var mainSubstance: String
    @NSManaged public var name: String
    @NSManaged public var recipes: [RecipeHasMedicines]

}

// MARK: Generated accessors for recipes
extension Medicines {

    @objc(addRecipesObject:)
    @NSManaged public func addToRecipes(_ value: RecipeHasMedicines)

    @objc(removeRecipesObject:)
    @NSManaged public func removeFromRecipes(_ value: RecipeHasMedicines)

    @objc(addRecipes:)
    @NSManaged public func addToRecipes(_ values: [RecipeHasMedicines])

    @objc(removeRecipes:)
    @NSManaged public func removeFromRecipes(_ values: [RecipeHasMedicines])

}
