import SwiftUI

struct SettingsView: View {
    var body: some View {
        ScrollView {
            NavigationLink(destination: DistancePickerView()) {
                Text("Pick Distance")
            }

            NavigationLink(destination: DistanceMeasurementPickerView()) {
                Text("Pick Measurement")
            }

            NavigationLink(destination: LanguageTypePickerView()) {
                Text("Pick Language")
            }
        }
    }
}

#Preview {
    SettingsView()
}
