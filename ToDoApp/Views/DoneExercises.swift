//
//  DoneExercises.swift
//  ToDoApp
//
//  Created by Ігор Іванченко on 05.11.2024.
//

import SwiftUI
import SwiftData

struct DoneExercises: View {
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<Staff> { $0.isDone == true }) var exercises: [Staff]

    var body: some View {
        NavigationStack () {
            VStack {
                if exercises.isEmpty {
                    ContentUnavailableView("No Done Exercises", systemImage: "person.fill.questionmark", description: Text("Would you eventually do something?"))
                } else {
                    DoneStaffView()
                }
                
            }
            .navigationTitle("Done Staff")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    if exercises.count < 5 {
                        Text("\(exercises.count) / 5")
                    }
                    else if exercises.count < 10 {
                        Text("\(exercises.count) / 10")
                    }
                    else {
                        Text("\(exercises.count) / 50")
                    }
                }
            }
        }
    }

}


#Preview {
    DoneExercises()
        .modelContainer(for: Staff.self)
}
