import SwiftUI

@main
struct MyWatchApp: App {
    @State private var appData = AppData()
    @State private var speechSynthesizerManager = SpeechSynthesizerManager()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appData.navPath) {
                ContentView()
                    .environment(\.appData, appData)
                    .environment(\.speechSynthesizerManager, speechSynthesizerManager)
            }
        }
    }
}
