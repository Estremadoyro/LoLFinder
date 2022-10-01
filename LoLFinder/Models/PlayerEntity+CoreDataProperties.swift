//
//  PlayerEntity+CoreDataProperties.swift
//  
//
//  Created by Leonardo  on 1/10/22.
//
//

import Foundation
import CoreData


extension PlayerEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlayerEntity> {
        return NSFetchRequest<PlayerEntity>(entityName: "PlayerEntity")
    }

    @NSManaged public var level: Int16
    @NSManaged public var name: String?

}
