//
//  TimeLeft.swift
//  ToDoApp
//
//  Created by Ігор Іванченко on 05.11.2024.
//

import SwiftUI

struct TimeLeft: View {
    let endDate: Date
    let days: Int
    let hours: Int
    let minutes: Int
    var rectangleColour = Color.black
    
    init(endDate: Date) {
        self.endDate = endDate
        let now = Date.now
        
        // Calculate the total time difference in seconds
        let totalSeconds = endDate.timeIntervalSince(now)
        
        // Convert the total seconds to days and hours
        self.days = Int(totalSeconds) / 86400 // 86400 seconds in a day
        self.hours = (Int(totalSeconds) % 86400) / 3600 // Remaining seconds to hours
        self.minutes = (Int(totalSeconds) % 3600 / 60) // Remaining seconds to minutes
    }
    
    var body: some View {
        VStack {
            if days > 0 {
                Text("\(days) days and \(hours) hours remaining")
                    .font(.headline)
                    .foregroundColor(.secondary)
            }
            else if days == 0 && hours > 0 {
                Text("\(hours) hours and \(minutes) remaining")
                    .font(.headline)
                    .foregroundColor(.secondary)
            }
            else if hours == 0 && minutes > 0 {
                Text("\(minutes) minutes remaining")
                    .font(.headline)
                    .foregroundColor(.secondary)
            }
            else {
                Text("You are out of time")
                    .font(.headline)
                    .foregroundColor(.secondary)
            }
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(minutes > 0 ? Color.green : Color.red)
                .padding(.vertical, 3)
        }
    }
    
}

#Preview {
    TimeLeft(endDate: Calendar.current.date(byAdding: .minute, value: 32, to: Date.now) ?? Date.now)
}
