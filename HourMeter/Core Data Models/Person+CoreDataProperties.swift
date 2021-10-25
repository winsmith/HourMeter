//
//  Person+CoreDataProperties.swift
//  HourMeter
//
//  Created by Daniel Jilg on 21.10.21.
//
//

import CoreData
import Foundation

public extension Person {
    @nonobjc class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged var name: String
    @NSManaged var note: String
    @NSManaged var id: UUID?
    @NSManaged var hourEntries: NSSet?
}

// MARK: Generated accessors for hourEntries

public extension Person {
    @objc(addHourEntriesObject:)
    @NSManaged func addToHourEntries(_ value: HourEntry)

    @objc(removeHourEntriesObject:)
    @NSManaged func removeFromHourEntries(_ value: HourEntry)

    @objc(addHourEntries:)
    @NSManaged func addToHourEntries(_ values: NSSet)

    @objc(removeHourEntries:)
    @NSManaged func removeFromHourEntries(_ values: NSSet)
}

extension Person {
    var typedHourEntries: [HourEntry] {
        guard let hourEntries = hourEntries else { return [] }
        
        guard let hourEntriesObjects = hourEntries.allObjects as? [HourEntry] else { return [] }
        
        return hourEntriesObjects.sorted { $0.occurredAt > $1.occurredAt }
    }

    var sumOfAllHourEntries: Double {
        return typedHourEntries.map { $0.deltaHours }.reduce(0.0, +) 
    }
}

extension Person: Identifiable {}
