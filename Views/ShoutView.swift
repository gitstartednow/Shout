import SwiftUI

struct ShoutView: View {
    @Environment(\.appData) var appData
    @Environment(\.speechSynthesizerManager) var speechSynthesizerManager

    var body: some View {
        Button {
            Task {
                await speechSynthesizerManager.startSpeaking(
                    appData.defaultMessage,
                    language: appData.selectedLanguageType.rawValue)
            }
        } label: {
            Text("Shout")
        }
    }
}

#Preview {
    ShoutView()
}
