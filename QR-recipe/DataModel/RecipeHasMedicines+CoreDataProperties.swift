//
//  RecipeHasMedicines+CoreDataProperties.swift
//  QR-recipe
//
//  Created by Vitalii Havryliuk on 5/14/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//
//

import Foundation
import CoreData


extension RecipeHasMedicines {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecipeHasMedicines> {
        return NSFetchRequest<RecipeHasMedicines>(entityName: "RecipeHasMedicines")
    }

    @NSManaged public var instruction: String
    @NSManaged public var recipe: Recipe
    @NSManaged public var medicine: Medicines

}
