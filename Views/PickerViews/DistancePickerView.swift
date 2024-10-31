import SwiftUI

struct DistancePickerView: View {
    @State private var selectedNumOfUnits = 0
    @Environment(\.appData) var appData

    var body: some View {
        VStack {
            Text("Selected Distance")
            Text("\(selectedNumOfUnits) \(appData.selectedDistanceMeasurementType.displayName)")

            if isLongerDistance {
                Stepper("", value: $selectedNumOfUnits, in: 0...100)
                    .labelsHidden()
                    .padding()
            } else {
                Stepper("", value: $selectedNumOfUnits, in: 0...100000, step: 100)
                    .labelsHidden()
                    .padding()
            }

            Button {
                selectedNumOfUnits = 0
            } label: {
                Text("Clear")
            }
            .foregroundStyle(.red)
        }
        .onChange(of: selectedNumOfUnits) { oldValue, newValue in
            if newValue != oldValue {
                appData.selectedNumOfUnits = newValue
            }
        }
        .onAppear {
            selectedNumOfUnits = appData.selectedNumOfUnits
        }
    }

    private var isLongerDistance: Bool {
        switch appData.selectedDistanceMeasurementType.displayName {
        case "Miles", "Kilometers", "Nautical Miles", "Laps":
            return true
        default:
            return false
        }
    }
}

#Preview {
    DistancePickerView()
}
