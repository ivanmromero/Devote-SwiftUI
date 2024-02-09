//
//  DevoteApp.swift
//  Devote
//
//  Created by Ivan Romero on 07/02/2024.
//

import SwiftUI

@main
struct DevoteApp: App {
    // MARK: - PROPERTIES
    let persistenceController = PersistenceController.shared
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
