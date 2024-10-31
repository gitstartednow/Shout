import SwiftUI

struct ShoutView: View {
    @Environment(\.appData) var appData
    @Environment(\.speechSynthesizerManager) var speechSynthesizerManager

    var body: some View {
        Button {
            Task {
                // Sleep for the specified countdown time in seconds, converted to nanoseconds
                try await Task.sleep(nanoseconds: UInt64(appData.selectedCountdownSeconds) * 1_000_000_000)

                // Call startSpeaking with the message and parameters from appData
                await speechSynthesizerManager.startSpeaking(
                    appData.defaultMessage,
                    language: appData.selectedLanguageType.rawValue
                )
            }
        } label: {
            Text("Shout")
        }
    }
}

#Preview {
    ShoutView()
}
