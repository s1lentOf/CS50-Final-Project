//
//  ContentView.swift
//  ToDoApp
//
//  Created by Ігор Іванченко on 04.11.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<Staff> { $0.isDone == false }) var exercises: [Staff]
    @State private var path = [Staff]()
    @FocusState private var isFocused: Bool?

    var body: some View {
        NavigationStack (path: $path) {
            VStack {
                if exercises.isEmpty {
                    // Show ContentUnavailableView if there are no exercises
                    ContentUnavailableView("No Exercise", systemImage: "xmark.bin", description: Text("Tap to add new staff"))
                        .onTapGesture {
                            let newStaff = Staff(
                                name: "",
                                about: "",
                                startDate: Date.now,
                                endDate: Calendar.current.date(byAdding: .day, value: 7, to: Date.now) ?? Date.now,
                                type: "Personal"
                            )
                            
                            // Insert newStaff into the modelContext
                            modelContext.insert(newStaff)
                            
                            // Update the navigation path to navigate to the new entry
                            path = [newStaff]
                        }
                        .focused($isFocused, equals: nil)
                } else {
                    // Show StaffView when there are exercises
                    StaffView()
                        .focused($isFocused, equals: nil)
                }
            }
            .onAppear {
                isFocused = nil
            }
            
            .navigationTitle("To Do List")
            .navigationDestination(for: Staff.self) { staff in
                AddNewExercise(staff: staff)
                    .focused($isFocused, equals: nil)
            }
            .toolbar {
                if !exercises.isEmpty {
                    Button {
                        let newStaff = Staff(
                            name: "",
                            about: "",
                            startDate: Date.now,
                            endDate: Calendar.current.date(byAdding: .day, value: 7, to: Date.now) ?? Date.now,
                            type: "Personal"
                        )
                        
                        // Insert newStaff into the modelContext
                        modelContext.insert(newStaff)
                        
                        // Update the navigation path to navigate to the new entry
                        path = [newStaff]
                    } label: {
                        Label("Add new", systemImage: "plus.circle")
                    }
                }
            }
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: Staff.self)
}
