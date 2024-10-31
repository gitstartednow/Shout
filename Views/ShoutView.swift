import SwiftUI

struct ShoutView: View {
    @Environment(\.appData) var appData
    @Environment(\.speechSynthesizerManager) var speechSynthesizerManager

    @State private var isShoutDisabled: Bool = false

    var body: some View {
        VStack {
            Spacer()

            Button {
                isShoutDisabled = true

                Task {
                    // Sleep for the specified countdown time in seconds, converted to nanoseconds
                    try await Task.sleep(nanoseconds: UInt64(appData.selectedCountdownSeconds) * 1_000_000_000)

                    // Call startSpeaking with the message and parameters from appData
                    await speechSynthesizerManager.startSpeaking(
                        appData.defaultMessage,
                        language: appData.selectedLanguageType.rawValue
                    )

                    // Re-enable the button after the task completes
                    isShoutDisabled = false
                }
            } label: {
                Text("Shout It")
            }
            .disabled(isShoutDisabled)

            Spacer()

            Toggle(isShoutDisabled ? "Enable" : "Disable", isOn: $isShoutDisabled)
                .padding()

            Spacer()
        }
    }
}

#Preview {
    ShoutView()
}
