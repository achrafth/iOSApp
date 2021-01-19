import SwiftUI
import CoreData

struct ReminderRow: View {
  let reminder: Reminder
  static let releaseFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
  }()

  var body: some View {
    VStack(alignment: .leading) {
      reminder.title.map(Text.init)
        .font(.title)
      HStack {
        reminder.genre.map(Text.init)
          .font(.caption)
        Spacer()
        reminder.releaseDate.map { Text(Self.releaseFormatter.string(from: $0)) }
          .font(.caption)
      }
    }
  }
}
