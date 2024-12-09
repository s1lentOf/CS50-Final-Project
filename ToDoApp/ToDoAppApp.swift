//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Ігор Іванченко on 04.11.2024.
//

import SwiftUI
import SwiftData

@main
struct ToDoAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Text("Show All")
                        Image(systemName: "house")
                    }
                
                DoneExercises()
                    .tabItem {
                        Text("Done")
                        Image(systemName: "checkmark.seal")
                    }
            }
            .modelContainer(for: [Staff.self, StaffType.self])
        }
    }
}
