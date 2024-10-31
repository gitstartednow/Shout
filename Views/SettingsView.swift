import SwiftUI

struct SettingsView: View {
    var body: some View {
        ScrollView {
            NavigationLink(destination: DistancePickerView()) {
                Text("Distance")
            }

            NavigationLink(destination: TimerPickerView()) {
                Text("Timer")
            }

            NavigationLink(destination: DistanceMeasurementPickerView()) {
                Text("Measurement")
            }

            NavigationLink(destination: LanguageTypePickerView()) {
                Text("Language")
            }
            // TODO: Implement Color Pallete selection
//            NavigationLink(destination: ColorPickerView()) {
//                Text("Pick Color")
//            }
        }
    }
}

#Preview {
    SettingsView()
}
