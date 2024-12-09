//
//  StaffType.swift
//  ToDoApp
//
//  Created by Ігор Іванченко on 06.11.2024.
//

import Foundation
import SwiftData

@Model
class StaffType: Identifiable {
    var name: String
    var emoji: String
    
    init(name: String, emoji: String) {
        self.name = name
        self.emoji = emoji
    }
}

