# 📋 My ToDo App

Simple and efficient tool to help you manage your tasks and stay organized!

https://github.com/user-attachments/assets/da852794-5ae0-4af6-a8f3-cd2569c3df99

## Brief description
Welcome to my **Final Project** for the Harvard course CS50. The app that I have created is called *'ToDoApp'*. As the name implies, it helps fellas keep track of the routine tasks. Moreover, it rememebers all tasks you have accomplished, so you can come back to the history and see your path. 

## Features
- 📝 Add, Edit, and Delete Tasks.
- ✅ Mark tasks as completed.
- 📜 View the history of accomplished tasks.
- 👥 Add new types of tasks
- 🎨 Customizable themes (Dark mode/Light mode).

## Prologue

One day, I was surfing the Internet to find interesting technologies to learn. I went to [Apple.com](https://www.apple.com/) and found out about an event that they hold annualy. It is called [Swift Student Challenge](https://developer.apple.com/swift-student-challenge/). I was soo amazed by that, I immediately started to find some interesting courses about this programming language. That's how I found a [Hacking With Swift](https://www.hackingwithswift.com/100/swiftui) course by Paul Hudson.
It was the first time I met **Swift** and since then, I am really amazing about this programming language and in general about everything what **Apple** creates.

> [!IMPORTANT]
> I am extremely thankful Paul Hudson for what he does. His courses are helping me soo much to learn new stuff and develop interesting things.

## Technologies I have used

For this project I have mainly used an Apple framework for writing on Swift called SwiftUI. To be more precise, I have used the following things from SwiftUI: 

- SwiftData - for storing Users information
- DatePicker - for picking the appropriate time
- Lists, VStacks, NavigationStacks - for general strcture of the app

> [!NOTE]
> Currently, this app does not send you any reminders (or so called 'Push notifications'), because it requires the Apple Developer account, which I can not but at the moment.

## Some troubles
The first thing that brought me the most difficulties was the idea of implementing the possibility to add new types. However, then I decided to create a new model for types: 

```swift
@Model
class StaffType: Identifiable {
    var name: String
    var emoji: String
    
    init(name: String, emoji: String) {
        self.name = name
        self.emoji = emoji
    }
}
```

I added some default types, which user I can select:
```swift
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
```

And I created computed property which combines unique elements from two array, that's why I use `Set()`:
```swift
var combinedTypes: [String] {
    let dynamicTypes = types.map { $0.name }
    return Set(dynamicTypes + typesDefault).sorted()
}
```

## Epilogue

To sum up, it was an interesting *adventure* in the IT field, while taking the **CS50 Course**. This course gave me a basic understanding of computer science, from programming fundamentals to more complex topics like algorithms and data structures. It challenged me to think critically and problem-solve in ways I had never done before. Along the way, I gained hands-on experience with various programming languages, tools, and techniques, all of which have broadened my understanding of the digital world. This journey has not only strengthened my technical skills but also sparked a deeper curiosity to continue learning and exploring the vast field of computer science. I am excited to apply what I’ve learned and take on new challenges in the future.

> [!IMPORTANT]
> I wanted to thank David J. Malan and other Staff of the **CS50 Course** for your incredible work. Your engaging lectures and passion for teaching make complex concepts accessible and inspiring. I'm truly grateful for your dedication and the impact you've had on my learning experience.






 
