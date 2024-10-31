import SwiftUI

struct DistanceMeasurementPickerView: View {
    @State private var selectedDistanceMeasurementType: DistanceMeasurementTypeEnum = .miles

    @Environment(\.appData) var appData

    var body: some View {
        VStack {
            Text("Selected Measurement")
            Text(selectedDistanceMeasurementType.displayName)
                .bold()
            Picker("", selection: $selectedDistanceMeasurementType) {
                ForEach(DistanceMeasurementTypeEnum.allCases) { type in
                    Text(type.displayName).tag(type)
                }
            }
            .pickerStyle(.wheel)
        }
        .onChange(of: selectedDistanceMeasurementType) { oldValue, newValue in
            if oldValue != newValue {
                appData.selectedDistanceMeasurementType = newValue
            }
        }
        .onAppear {
            selectedDistanceMeasurementType = appData.selectedDistanceMeasurementType
        }
    }
}

#Preview {
    LanguageTypePickerView()
}
