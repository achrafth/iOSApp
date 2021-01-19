import SwiftUI
import CoreData
// swiftlint:disable multiple_closures_with_trailing_closure
struct ReminderList: View {
    
    
    
  @Environment(\.managedObjectContext) var managedObjectContext
  // 1.
  @FetchRequest(
    // 2.
    entity: Reminder.entity(),
    // 3.
    sortDescriptors: [
      NSSortDescriptor(keyPath: \Reminder.title!, ascending: true)
    ]
    //,predicate: NSPredicate(format: "genre contains 'Action'")
    // 4.
  )
    var reminders: FetchedResults<Reminder>

  @State var isPresented = false

  var body: some View {
    NavigationView() {
        
       
        
      List {
        ForEach(reminders, id: \.title) {
          ReminderRow(reminder: $0)
        }
        .onDelete(perform: deleteReminder)
      }
      .sheet(isPresented: $isPresented) {
        AddReminder { title, genre, release in
          self.addReminder(title: title, genre: genre, releaseDate: release)
          self.isPresented = false
        }
      }
      .navigationBarTitle(Text("Reminders"))
      .navigationBarItems(trailing:
        Button(action: { self.isPresented.toggle() }) {
          Image(systemName: "plus")
        }
      )
        }
  }

  func deleteReminder(at offsets: IndexSet) {
    // 1.
    offsets.forEach { index in
      // 2.
      let reminder = self.reminders[index]

      // 3.
      self.managedObjectContext.delete(reminder)
    }

    // 4.
    saveContext()
  }


  func addReminder(title: String, genre: String, releaseDate: Date) {
    // 1
    let newReminder = Reminder(context: managedObjectContext)

    // 2
    newReminder.title = title
    newReminder.genre = genre
    newReminder.releaseDate = releaseDate

    // 3
    saveContext()
  }


  func saveContext() {
    do {
      try managedObjectContext.save()
    } catch {
      print("Error saving managed object context: \(error)")
    }
  }
}

struct ReminderList_Previews: PreviewProvider {
  static var previews: some View {
    ReminderList()
  }
}
