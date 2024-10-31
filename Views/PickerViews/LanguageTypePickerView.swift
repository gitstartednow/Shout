import SwiftUI

struct LanguageTypePickerView: View {
    @State private var selectedLanguageType = LanguageTypeEnum.americanEnglish
    @Environment(\.appData) var appData

    var body: some View {
        VStack {
            Text("Selected Language")
            Text(selectedLanguageType.displayName)
                .bold()
            Picker("", selection: $selectedLanguageType) {
                ForEach(LanguageTypeEnum.allCases) { languageType in
                    Text(languageType.displayName).tag(languageType)
                }
            }
            .pickerStyle(.wheel)
        }
        .onAppear {
            selectedLanguageType = appData.selectedLanguageType
        }
        .onDisappear {
            appData.selectedLanguageType = selectedLanguageType
        }
    }
}

#Preview {
    LanguageTypePickerView()
}
