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
            DatePicker(LocalizedStringKey("entry-editor-date"), selection: $hourEntry.occurredAt, in: ...Date(), displayedComponents: .date)

            TimeIntervalEditField(timeInterval: $hourEntry.deltaHours)
        }
        .navigationTitle("entry-editor-title")
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
