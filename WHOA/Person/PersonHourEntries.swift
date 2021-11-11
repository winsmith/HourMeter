//
//  PersonHourEntries.swift
//  HourMeter
//
//  Created by Daniel Jilg on 21.10.21.
//

import SwiftUI

struct PersonHourEntries: View {
    @ObservedObject var person: Person

    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        if !person.note.isEmpty {
            Text(person.note)
                .font(.footnote)
                .foregroundColor(.secondary)
        }

        if person.typedHourEntries.isEmpty {
            Text("person-hour-entries-empty-list-hint")
                .foregroundColor(.secondary)
        }

        List {
            ForEach(person.typedHourEntries) { entry in
                NavigationLink {
                    HourEntryEditor(hourEntry: entry)
                } label: {
                    HStack {
                        Text(entry.occurredAt, style: .date)
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(DateComponentsFormatter.timeIntervalString(from: entry.deltaHours))
                    }
                }
            }
            .onDelete(perform: deleteItems)
        }
        .toolbar {
            ToolbarItem {
                Button(action: addItem) {
                    Label("person-hour-list-new-entry", systemImage: "plus")
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = HourEntry(context: viewContext)
            newItem.id = UUID()
            newItem.occurredAt = Date().beginning(of: .day)!
            newItem.person = person

            save()
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { person.typedHourEntries[$0] }.forEach(viewContext.delete)
            save()
        }
    }

    private func save() {
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .none
    return formatter
}()
