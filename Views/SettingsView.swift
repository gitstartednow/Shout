import SwiftUI

struct SettingsView: View {
    var body: some View {
        ScrollView {
            NavigationLink(destination: DistancePickerView()) {
                Text("Pick Distance")
            }

            NavigationLink(destination: TimerPickerView()) {
                Text("Pick Timer")
            }

            NavigationLink(destination: DistanceMeasurementPickerView()) {
                Text("Pick Measurement")
            }

            NavigationLink(destination: LanguageTypePickerView()) {
                Text("Pick Language")
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
