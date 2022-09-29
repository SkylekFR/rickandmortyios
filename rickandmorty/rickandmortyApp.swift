//
//  rickandmortyApp.swift
//  rickandmorty
//
//  Created by Emilien on 13/06/2022.
//

import SwiftUI

@main
struct rickandmortyApp: App {
    let persistenceController = PersistenceController.shared
    
    private var router = Router()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
        }
    }
}
