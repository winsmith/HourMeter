//
//  PersonEditor.swift
//  HourMeter
//
//  Created by Daniel Jilg on 21.10.21.
//

import CoreData
import SwiftUI

struct PersonEditor: View {
    @ObservedObject var person: Person

    @Binding var isShowing: Bool

    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        NavigationView {
            Form {
                Section("person-editor-edit-person") {
                    TextField("person-editor-name", text: $person.name, prompt: Text("person-editor-name-prompt"))
                    TextField("person-editor-note", text: $person.note, prompt: Text("person-editor-name-prompt"))
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("person-editor-save") {
                        save()
                        isShowing = false
                    }
                    .keyboardShortcut(.defaultAction)
                }
            }
            .navigationTitle("person-editor-title-name \(person.name)")
        }
        .onDisappear {
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
