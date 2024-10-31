import SwiftUI

struct ColorPickerView: View {
    @State private var selectedColorIndex = 0
    @Environment(\.appData) var appData

    // Define the colors in an array
    let colors: [Color] = [
        Color("AccentColor"),
        Color("HighlightRed"),
        Color("NeutralWhite"),
        Color("PrimaryOrange"),
        Color("SecondaryYellow"),
        Color("BaseGray")
    ]

    var body: some View {
        VStack {
            Text("Selected Color")

            // Display the selected color as a circle
            Circle()
                .fill(colors[selectedColorIndex])
                .frame(width: 50, height: 50)
                .padding()

            // Use the Stepper to cycle through colors
            Stepper("", value: $selectedColorIndex, in: 0...(colors.count - 1))
                .labelsHidden()
                .padding()

            Button {
                selectedColorIndex = 0
            } label: {
                Text("Reset Color")
            }
            .foregroundStyle(.red)
        }
        .onChange(of: selectedColorIndex) { oldValue, newValue in
            if newValue != oldValue {
                // Update app data or any external binding
                appData.selectedColorIndex = newValue // Assuming you have this in `appData`
            }
        }
        .onAppear {
            // Load the saved color index from `appData`
            selectedColorIndex = appData.selectedColorIndex
        }
    }
}

#Preview {
    ColorPickerView()
}

