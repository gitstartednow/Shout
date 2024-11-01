import SwiftUI
import Observation
import Shimmer

struct ContentView: View {
    @Environment(\.appData) var appData

    var body: some View {
        VStack {
            VStack {
                Text("Shout")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundStyle(.primaryOrange)
                    .shimmering()
            }
            ScrollView {
                NavigationLink(destination: ShoutView()) {
                    Text("Shout")
                }

                NavigationLink(destination: SettingsView()) {
                    Text("Settings")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
