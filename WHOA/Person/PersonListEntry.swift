//
//  PersonListEntry.swift
//  HourMeter
//
//  Created by Daniel Jilg on 23.10.21.
//

import SwiftUI

struct PersonListEntry: View {
    @ObservedObject var person: Person

    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        HStack {
            Text(person.name)
            Spacer()
            Text(DateComponentsFormatter.timeIntervalString(from: person.sumOfAllHourEntries)).foregroundColor(.secondary)
        }
    }
}
