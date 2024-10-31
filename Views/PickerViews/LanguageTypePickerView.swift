import SwiftUI

struct LanguageTypePickerView: View {
    @State private var selectedLanguageType = LanguageTypeEnum.americanEnglish
    @Environment(\.appData) var appData

    var body: some View {
        VStack {
            Text("Selected Language")
            Text(appData.selectedLanguageType.displayName)
                .bold()
            Picker("", selection: $selectedLanguageType) {
                ForEach(LanguageTypeEnum.allCases) { languageType in
                    Text(languageType.displayName).tag(languageType)
                }
            }
            .pickerStyle(.wheel)
        }
        .onChange(of: selectedLanguageType) { oldValue, newValue in
            if oldValue != newValue {
                appData.selectedLanguageType = newValue
            }
        }
        .onAppear {
            selectedLanguageType = appData.selectedLanguageType
        }
    }
}

#Preview {
    LanguageTypePickerView()
}
