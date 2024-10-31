import SwiftUI
import Observation

@Observable
final class AppData {
    var navPath = NavigationPath()

    // Initialize from UserDefaults or set default values
    var selectedNumOfUnits: Int {
        get { UserDefaults.standard.integer(forKey: "selectedNumOfUnits") }
        set { UserDefaults.standard.set(newValue, forKey: "selectedNumOfUnits") }
    }

    var selectedCountdownSeconds: Int {
        get {
            return UserDefaults.standard.integer(forKey: "selectedCountdownSeconds")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "selectedCountdownSeconds")
        }
    }

    var selectedDistanceMeasurementType: DistanceMeasurementTypeEnum {
        get {
            if let savedValue = UserDefaults.standard.string(forKey: "selectedDistanceMeasurementType"),
               let type = DistanceMeasurementTypeEnum(rawValue: savedValue) {
                return type
            }
            return .miles // Default value
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "selectedDistanceMeasurementType")
        }
    }

    var selectedLanguageType: LanguageTypeEnum {
        get {
            if let savedValue = UserDefaults.standard.string(forKey: "selectedLanguageType"),
               let type = LanguageTypeEnum(rawValue: savedValue) {
                return type
            }
            return .americanEnglish // Default value
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "selectedLanguageType")
        }
    }

    var selectedColorIndex: Int {
        get {
            return UserDefaults.standard.integer(forKey: "selectedColorIndex")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "selectedColorIndex")
        }
    }

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
