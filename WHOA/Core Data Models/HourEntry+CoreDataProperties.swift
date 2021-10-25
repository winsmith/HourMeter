//
//  HourEntry+CoreDataProperties.swift
//  HourMeter
//
//  Created by Daniel Jilg on 21.10.21.
//
//

import CoreData
import Foundation

public extension HourEntry {
    @nonobjc class func fetchRequest() -> NSFetchRequest<HourEntry> {
        return NSFetchRequest<HourEntry>(entityName: "HourEntry")
    }

    @NSManaged var deltaHours: Double
    @NSManaged var occurredAt: Date
    @NSManaged var id: UUID
    @NSManaged var person: Person
}

extension HourEntry: Identifiable {}
