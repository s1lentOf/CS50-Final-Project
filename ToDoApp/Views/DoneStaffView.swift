//
//  DoneStaffView.swift
//  ToDoApp
//
//  Created by Ігор Іванченко on 10.11.2024.
//

import SwiftUI
import SwiftData

struct DoneStaffView: View {
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<Staff> { $0.isDone == true }) var exercises: [Staff]

    var body: some View {
        List {
            ForEach(exercises, id: \.self) { exercise in
                HStack {
                    Button {
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
                        let timeDifference = exercise.doneTime.timeIntervalSince(exercise.endDate)
                        let days = abs(Int(timeDifference) / 86400) // Absolute value to handle positive/negative difference
                        let hours = abs((Int(timeDifference) % 86400) / 3600)
                        let minutes = abs((Int(timeDifference) % 3600) / 60)
                        
                        if exercise.doneTime < exercise.endDate {
                            // Completed early or on time
                            if days > 0 {
                                Text("\(days) day\(days > 1 ? "s" : "") and \(hours) hour\(hours > 1 ? "s" : "") left before the due date.")
                            } else if hours > 0 {
                                Text("\(hours) hour\(hours > 1 ? "s" : "") and \(minutes) minute\(minutes > 1 ? "s" : "") left before the due date.")
                            } else {
                                Text("\(minutes) minute\(minutes > 1 ? "s" : "") left before the due date.")
                            }
                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(Color.green)
                                .padding(.vertical, 3)
                        } else {
                            // Completed after the deadline
                            if days > 0 {
                                Text("Completed with a delay of \(days) day\(days > 1 ? "s" : "").")
                            } else if hours > 0 {
                                Text("Completed with a delay of \(hours) hour\(hours > 1 ? "s" : "").")
                            } else {
                                Text("Completed with a delay of \(minutes) minute\(minutes > 1 ? "s" : "").")
                            }
                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(Color.red)
                                .padding(.vertical, 3)
                        }
                    
                        
                        
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
    DoneStaffView()
        .modelContainer(for: Staff.self)
}
