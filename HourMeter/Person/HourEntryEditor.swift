//
//  HourEntryEditor.swift
//  HourMeter
//
//  Created by Daniel Jilg on 21.10.21.
//

import SwiftUI

struct HourEntryEditor: View {
    @ObservedObject var hourEntry: HourEntry

    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        Form {
            DatePicker("Datum", selection: $hourEntry.occurredAt, in: ...Date(), displayedComponents: .date)
            
            HStack {
                Button {
                    hourEntry.deltaHours -= 3600
                } label: {
                    Text("-")
                        .frame(width: 22, height: 22)
                        .font(.largeTitle)
                        .padding()
                }
                .buttonStyle(PlainButtonStyle())

                Spacer()
                
                VStack {
                    Text(hourEntry.humanReadableDeltaHours)
                        .font(.largeTitle)
                    Text("Stunden")
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Button {
                    hourEntry.deltaHours += 3600
                } label: {
                    Text("+")
                        .frame(width: 22, height: 22)
                        .font(.largeTitle)
                        .padding()
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .navigationTitle("Eintrag Bearbeiten")
        .onDisappear {
            save()
        }
    }

    private func save() {
        do {
            try viewContext.save()
            hourEntry.person.objectWillChange.send()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
