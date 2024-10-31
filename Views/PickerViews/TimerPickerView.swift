import SwiftUI

struct TimerPickerView: View {
    @Environment(\.appData) var appData
    @State private var selectedCountdownSeconds: Int = 0

    var body: some View {
        VStack {
            Text("Second Countdown")
            Text("\(selectedCountdownSeconds) \(selectedCountdownSeconds == 1 ? "second" : "seconds")")

            Picker("", selection: $selectedCountdownSeconds) {
                ForEach(0...120, id: \.self) { second in
                    Text("\(second) sec").tag(second)
                }
            }
            .pickerStyle(WheelPickerStyle())
        }
        .onChange(of: selectedCountdownSeconds) { oldValue, newValue in
            if oldValue != newValue {
                appData.selectedCountdownSeconds = newValue
            }
        }
        .onAppear {
            selectedCountdownSeconds = appData.selectedCountdownSeconds
        }
    }
}

#Preview {
    TimerPickerView()
        .environment(\.speechSynthesizerManager, SpeechSynthesizerManager())
}
