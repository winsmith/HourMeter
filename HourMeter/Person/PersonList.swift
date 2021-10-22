//
//  PersonEditorView.swift
//  HourMeter
//
//  Created by Daniel Jilg on 21.10.21.
//

import CoreData
import SwiftUI

struct PersonList: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Person.name, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Person>

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { person in
                    NavigationLink {
                        PersonOverview(person: person)
                    } label: {
                        PersonListEntry(person: person)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Personen")
            .toolbar {
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Neue Person", systemImage: "plus")
                    }
                }
            }
            Text("Bitte wählen Sie eine Person aus")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Person(context: viewContext)
            newItem.name = "Neue Person"
            newItem.id = UUID()

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

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

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
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct PersonEditorView_Previews: PreviewProvider {
    static var previews: some View {
        PersonList()
    }
}
