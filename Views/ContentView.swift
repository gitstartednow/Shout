import SwiftUI
import Observation

struct ContentView: View {
    @Environment(\.appData) var appData

    var body: some View {
        VStack {
            NavigationLink(destination: SettingsView()) {
                Text("Settings")
            }

            NavigationLink(destination: ShoutView()) {
                Text("Shout")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.primaryOrange)
    }
}

#Preview {
    ContentView()
}
