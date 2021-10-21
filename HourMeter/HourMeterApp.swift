//
//  HourMeterApp.swift
//  HourMeter
//
//  Created by Daniel Jilg on 21.10.21.
//

import SwiftUI

@main
struct HourMeterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
