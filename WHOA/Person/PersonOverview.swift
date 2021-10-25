//
//  PersonOverview.swift
//  HourMeter
//
//  Created by Daniel Jilg on 21.10.21.
//

import SwiftUI

struct PersonOverview: View {
    @ObservedObject var person: Person

    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        PersonHourEntries(person: person)
            .navigationBarTitleDisplayMode(.large)
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    PersonMetaInfo(person: person)
                }
            })
    }
}
