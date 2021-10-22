//
//  HourMeteriPadApp.swift
//  HourMeteriPad
//
//  Created by Daniel Jilg on 22.10.21.
//

import SwiftUI

@main
struct HourMeteriPadApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            PersonList()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .accentColor(Color("Petrol"))
        }
    }
}
