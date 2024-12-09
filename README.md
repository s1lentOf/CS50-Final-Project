# 📋 My ToDo App

Simple and efficient tool to help you manage your tasks and stay organized!

## Brief description
Welcome to my **Final Project** for the Harvard course CS50x. The app that I have created is called *'ToDoApp'*. As the name implies, it helps fellas keep track of the routine tasks. Moreover, it rememebers all tasks you have accomplished, so you can come back to the history and see your path. 

## Features
- 📝 Add, Edit, and Delete Tasks.
- ✅ Mark tasks as completed.
- 📜 View the history of accomplished tasks.
- 👥 Add new types of tasks
- 🎨 Customizable themes (Dark mode/Light mode).

## Technologies I have used

For this project I have mainly used an Apple framework for writing on Swift called SwiftUI. To be more precise, I have used the following things from SwiftUI: 

- SwiftData - for storing Users information
- DatePicker - for picking the appropriate time
- Lists, VStacks, NavigationStacks - for general strcture of the app

> [!NOTE]
> Currently, this app does not send you any reminders (or so called 'Push notifications'), because it requires the Apple Developer account, which I can not but at the moment.

## Some troubles
The first thing that brought me the most difficulties was the idea of implementing the possibility to add new types. However, then I decided to create a new model for types: 

´´´
@Model
class StaffType: Identifiable {
    var name: String
    var emoji: String
    
    init(name: String, emoji: String) {
        self.name = name
        self.emoji = emoji
    }
}
´´´






