//
//  ContentView.swift
//  rickandmorty
//
//  Created by Emilien on 13/06/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        switch router.currentActivity {
        case .mainView:
            MainView()
        default:
            MainView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
