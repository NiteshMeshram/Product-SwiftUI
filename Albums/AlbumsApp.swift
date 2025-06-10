//
//  AlbumsApp.swift
//  Albums
//
//  Created by NiteshMeshram on 05/06/25.
//

import SwiftUI

@main
struct AlbumsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            DashboardView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
