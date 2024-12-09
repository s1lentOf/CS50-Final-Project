//
//  StaffView.swift
//  ToDoApp
//
//  Created by Ігор Іванченко on 04.11.2024.
//

import SwiftUI
import SwiftData

struct StaffView: View {
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<Staff> { $0.isDone == false }) var exercises: [Staff]
    @State private var colorInside = Color.clear

    var body: some View {
        List {
            ForEach(exercises, id: \.self) { exercise in
                HStack {
                    Button {
                        exercise.doneTime = Date.now
                        withAnimation {
                            exercise.isDone.toggle()
                            try? modelContext.save()
                        }
                    } label: {
                        Circle()
                            .fill(exercise.isDone ? Color.green : Color.clear)
                            .opacity(0.6)
                            .frame(width: 20, height: 20)
                            .overlay(Circle().stroke(Color.black, lineWidth: 2))
                            .scaleEffect(exercise.isDone ? 1.2 : 1)
                            .animation(.easeInOut(duration: 0.3), value: exercise.isDone)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.horizontal, 5)

                    VStack(alignment: .center, spacing: 4) {
                        TimeLeft(endDate: exercise.endDate)

                        NavigationLink(value: exercise) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(exercise.name)
                                        .font(.headline.bold())
                                    Text(exercise.about)
                                        .font(.caption)
                                        .lineLimit(1)
                                        .truncationMode(.tail)
                                }

                                Spacer()

                                EmojiView(type: exercise.type)
                                    .padding(.leading, 30)
                            }
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .onDelete(perform: deleteExercise)
        }
    }

    func deleteExercise(at offsets: IndexSet) {
        for offset in offsets {
            let staffToDelete = exercises[offset]
            modelContext.delete(staffToDelete)
        }
    }
}

#Preview {
    StaffView()
        .modelContainer(for: Staff.self)
}
