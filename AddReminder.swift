import SwiftUI
import CoreData

struct AddReminder: View {
  static let DefaultReminderTitle = "An untitled masterpiece"
  static let DefaultReminderGenre = "Genre-buster"

  @State var title = ""
  @State var genre = ""
  @State var releaseDate = Date()
  let onComplete: (String, String, Date) -> Void

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Title")) {
          TextField("Title", text: $title)
        }
        Section(header: Text("Genre")) {
          TextField("Genre", text: $genre)
        }
        Section {
          DatePicker(
            selection: $releaseDate,
            displayedComponents: .date) {
              Text("Release Date").foregroundColor(Color(.gray))
          }
        }
        Section {
          Button(action: addMoveAction) {
            Text("Add Reminder")
          }
        }
      }
      .navigationBarTitle(Text("Add Reminder"), displayMode: .inline)
    }
  }

  private func addMoveAction() {
    onComplete(
      title.isEmpty ? AddReminder.DefaultReminderTitle : title,
      genre.isEmpty ? AddReminder.DefaultReminderGenre : genre,
      releaseDate)
  }
}
