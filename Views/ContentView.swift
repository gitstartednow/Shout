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
    }
}

#Preview {
    ContentView()
}
