//
//  HourEntry+CoreDataProperties.swift
//  HourMeter
//
//  Created by Daniel Jilg on 21.10.21.
//
//

import Foundation
import CoreData


extension HourEntry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HourEntry> {
        return NSFetchRequest<HourEntry>(entityName: "HourEntry")
    }

    @NSManaged public var deltaHours: Double
    @NSManaged public var occurredAt: Date
    @NSManaged public var id: UUID
    @NSManaged public var person: Person

}

extension HourEntry {
    var humanReadableDeltaHours: String {
        DateComponentsFormatter().string(from: deltaHours)!
    }
}

extension HourEntry : Identifiable {

}
