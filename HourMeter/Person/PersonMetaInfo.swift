//
//  PersonMetaInfo.swift
//  HourMeter
//
//  Created by Daniel Jilg on 21.10.21.
//

import SwiftUI

struct PersonMetaInfo: View {
    @ObservedObject var person: Person

    @Environment(\.managedObjectContext) private var viewContext

    @State var isShowingPersonEditor = false

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(person.name)
                        .font(.title)
                        .bold()

                    Button {
                        isShowingPersonEditor = true
                    } label: {
                        Label("Person Bearbeiten", systemImage: "pencil")
                    }
                }

                if let note = person.note {
                    Text(note)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }

            Spacer()

            VStack {
                Text(DateComponentsFormatter.timeIntervalString(from: person.sumOfAllHourEntries))
                    .font(.system(.caption, design: .rounded))
                Text("Stunden")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
        .sheet(isPresented: $isShowingPersonEditor) {
            PersonEditor(person: person, isShowing: $isShowingPersonEditor)
        }
    }
}
