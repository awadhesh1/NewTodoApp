//
//  NewTodoappApp.swift
//  NewTodoapp
//
//  Created by Awadhesh on 2025-11-27.
//

import SwiftUI
import CoreData

@main
struct NewTodoappApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
