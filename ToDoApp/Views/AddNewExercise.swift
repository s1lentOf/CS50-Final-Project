//
//  AddNewExercise.swift
//  ToDoApp
//
//  Created by Ігор Іванченко on 04.11.2024.
//

import SwiftUI
import SwiftData

struct AddNewExercise: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @Bindable var staff: Staff
    @Query var types: [StaffType]
    @FocusState private var isTypingName: Bool
    @FocusState private var isTypingAbout: Bool
    
    @State private var typesDefault = [
                "Personal",
                "Work or Professional",
                "Household Chores",
                "Self-Improvement Tasks",
                "Pet Care Tasks",
                "Long-Term Goals",
                "Creative or Hobby Tasks",
                "Social or Relationship Tasks"
    ]
    
    var combinedTypes: [String] {
        let dynamicTypes = types.map { $0.name }
        // Combine unique elements from two array
        return Set(dynamicTypes + typesDefault).sorted()
    }
    
    @State private var isShowingAddType = false
    
    
    
    var body: some View {
        
        VStack {
            VStack(spacing: 16) {
                Spacer()
                // Name Field with Animation
                VStack(alignment: .leading) {
                    ZStack(alignment: .leading) {
                        TextField("", text: $staff.name)
                            .padding(.leading)
                            .frame(height: 55)
                            .focused($isTypingName)
                            .background(isTypingName ? .blue : Color.primary, in: RoundedRectangle(cornerRadius: 14).stroke(lineWidth: 2))
                        
                        // Floating Label Logic
                        Text("Name")
                            .padding(.horizontal, 5)
                            .background(Color(UIColor.systemGroupedBackground).opacity(isTypingName || !staff.name.isEmpty ? 1 : 0))
                            .foregroundColor(isTypingName ? .blue : Color.primary)
                            .padding(.leading)
                            .offset(y: isTypingName || !staff.name.isEmpty ? -30 : 0)
                            .onTapGesture {
                                isTypingName.toggle()
                            }
                        // Apply animation only if field is empty and focused
                            .animation(staff.name.isEmpty ? .linear(duration: 0.2) : .none, value: isTypingName)
                    }
                }
                .padding(.horizontal)
                
                // About Field with Animation
                VStack(alignment: .leading) {
                    ZStack(alignment: .leading) {
                        TextField("", text: $staff.about, axis: .vertical)
                            .padding(.leading)
                            .frame(height: 100)
                            .focused($isTypingAbout)
                            .background(isTypingAbout ? .blue : Color.primary, in: RoundedRectangle(cornerRadius: 14).stroke(lineWidth: 2))
                        
                        // Floating Label Logic
                        Text("About")
                            .padding(.horizontal, 5)
                            .background(Color(UIColor.systemGroupedBackground).opacity(isTypingAbout || !staff.about.isEmpty ? 1 : 0))
                            .foregroundColor(isTypingAbout ? .blue : Color.primary)
                            .padding(.leading)
                            .offset(y: isTypingAbout || !staff.about.isEmpty ? -53 : 0)
                            .onTapGesture {
                                isTypingAbout.toggle()
                                
                            }
                        // Apply animation only if field is empty and focused
                            .animation(staff.about.isEmpty ? .linear(duration: 0.2) : .none, value: isTypingAbout)
                    }
                }
                
                .padding(.horizontal)
                
                List {
                    Section {
                        Picker("Type", selection: $staff.type) {
                            ForEach(combinedTypes, id: \.self) { type in
                                Text(type)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    VStack {
                        DatePicker("Start Date:", selection: $staff.startDate, in: Date.now...)
                        DatePicker("Due Date:", selection: $staff.endDate, in: staff.startDate...)
                    }
                }
                
                                
                // Save Button
                
                Button {
                    dismiss()
                } label: {
                    Text("Save Exercise")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.secondary.opacity(0.6))
                        .foregroundColor(.primary)
                        .cornerRadius(10)
                }
                .padding()
                .disabled(staff.name.isEmpty)
            }
            .ignoresSafeArea(.keyboard)
            
            .sheet(isPresented: $isShowingAddType) {
                AddNewType(staff: staff)
            }
            .onTapGesture {
                isTypingName = false
                isTypingAbout = false
            }
            
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        if staff.name.isEmpty && staff.about.isEmpty {
                            modelContext.delete(staff)
                            dismiss()
                        } else {
                            dismiss()
                        }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add New Type") {
                        isShowingAddType = true
                    }
                }
            }
            
            .navigationBarBackButtonHidden()
            .navigationTitle("Add New Exercise")
            .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
        }
    }
}


#Preview {
    let newStaff = Staff(name: "Go for a walk", about: "I have to walk for at least 30 min", startDate: Date.now, endDate: Calendar.current.date(byAdding: .day, value: 7, to: Date.now) ?? Date.now, type: "Personal")

    AddNewExercise(staff: newStaff)
}

