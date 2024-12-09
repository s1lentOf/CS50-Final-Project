//
//  Staff.swift
//  ToDoApp
//
//  Created by Ігор Іванченко on 04.11.2024.
//

import Foundation
import SwiftData



@Model
class Staff: Identifiable {
    var id = UUID()
    var name: String
    var about: String
    var startDate: Date
    var endDate: Date
    var type: String
    var isDone: Bool = false
    var doneTime: Date = Date.now
    
    init(name: String, about: String, startDate: Date, endDate: Date, type: String) {
        self.name = name
        self.about = about
        self.startDate = startDate
        self.endDate = endDate
        self.type = type
    }

}
