import SwiftUI
import Observation
import SwiftData

@Observable
final class AppData {
    var navPath = NavigationPath()

    var selectedNumOfUnits = 10
    var selectedLanguageType: LanguageTypeEnum = .americanEnglish
    var selectedDistanceMeasurementType: DistanceMeasurementTypeEnum = .miles
    var defaultMessage: String {
        "\(selectedNumOfUnits) \(selectedDistanceMeasurementType.displayName)!"
    }
}

struct AppDataKey: EnvironmentKey {
    static let defaultValue = AppData()
}

extension EnvironmentValues {
    var appData: AppData {
        get { self[AppDataKey.self] }
        set { self[AppDataKey.self] = newValue }
    }
}
