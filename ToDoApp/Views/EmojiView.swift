//
//  EmojiView.swift
//  ToDoApp
//
//  Created by Ігор Іванченко on 05.11.2024.
//

import SwiftUI
import SwiftData

struct EmojiView: View {
    let type: String
    @Query var types: [StaffType]
    
    var body: some View {
        switch type {
            
        case "Work or Professional":
            Text("💼")
        case "Household Chores":
            Text("🏠")
        case "Self-Improvement Tasks":
            Text("📚")
        case "Pet Care Tasks":
            Text("🐶")
        case "Long-Term Goals":
            Text("🚀")
        case "Creative or Hobby Tasks":
            Text("🎨")
        case "Social or Relationship Tasks":
            Text("👥")
        case "Personal":
            Text("🧘‍♀️")
        default:
            Text(findEmoji(name: type))
            
        }
    }
    
    func findEmoji(name: String) -> String {
        var emoji = ""
        for type in types {
            if (name == type.name) {
                emoji = type.emoji
                break
            }
        }
        return emoji
    }
}

#Preview {
    EmojiView(type: "Personal")
}
