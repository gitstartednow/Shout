import Foundation

enum DistanceMeasurementTypeEnum: String, CaseIterable, Identifiable, Codable, Hashable {
    case miles = "mi"
    case kilometers = "km"
    case meters = "m"
    case yards = "yd"
    case feet = "ft"
    case nauticalMiles = "nmi"
    case laps = "laps"

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .miles: return "Miles"
        case .kilometers: return "Kilometers"
        case .meters: return "Meters"
        case .yards: return "Yards"
        case .feet: return "Feet"
        case .nauticalMiles: return "Nautical Miles"
        case .laps: return "Laps"
        }
    }
}
