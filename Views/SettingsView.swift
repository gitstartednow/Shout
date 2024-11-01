import SwiftUI

struct SettingsView: View {
    @Environment(\.appData) var appData
    var body: some View {
        ScrollView {
            NavigationLink(destination: DistancePickerView()) {
                Text("Distance")
            }
            .tint(.green)

            NavigationLink(destination: TimerPickerView()) {
                Text("Timer")
            }

            NavigationLink(destination: DistanceMeasurementPickerView()) {
                Text("Measurement")
            }

            NavigationLink(destination: LanguageTypePickerView()) {
                Text("Language")
            }
        }
    }
}

#Preview {
    SettingsView()
}
