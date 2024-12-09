//
//  AddNewType.swift
//  ToDoApp
//
//  Created by Ігор Іванченко on 05.11.2024.
//

import SwiftUI
import SwiftData

struct AddNewType: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @State var staff: Staff
    
    @State private var emojisVariant = ["💼", "🏠", "📚", "🐶", "🚀", "🎨", "👥", "🧘‍♀️", "🍽️", "🛠️", "✈️", "🏋️‍♂️", "🧑‍💻", "🌱", "🎶"]
    @State private var selectedEmoji = "🏠"
    @State private var newType = ""
    var body: some View {
        List {
            HStack {
                Text("Type name:")
                TextField("", text: $newType)
            }
            
            
            HStack {
                Text("Select emoji:")
                Picker("Select emoji", selection: $selectedEmoji) {
                    ForEach(emojisVariant, id: \.self) { emoji in
                        Text(emoji)
                    }
                }
                .pickerStyle(.wheel)
            }
            
            Button ("Save") {
                let newTypeModel = StaffType(name: newType, emoji: selectedEmoji)
                modelContext.insert(newTypeModel)
                dismiss()
            }
            .disabled(newType.isEmpty)
        }
    }
}


#Preview {
    let newStaff = Staff(name: "", about: "", startDate: Date.now, endDate: Date.now, type: "")
    AddNewType(staff: newStaff)
}
