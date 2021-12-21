//
//  UserDefaults+Weather.swift
//  WeatherApp
//
//  Created by Silvia Kuzmova on 20.11.21.
//

import Foundation

struct UserDefaultsKeys {
    static let timeNotation = "timeNotation"
    static let unitsNotation = "unitsNotation"
    static let temperatureNotation = "temperatureNotation"
}

extension UserDefaults: UserDefaultsType {

    var timeNotation: TimeNotation {
        get {
            let storedValue = integer(forKey: UserDefaultsKeys.timeNotation)
            return TimeNotation(rawValue: storedValue) ?? TimeNotation.twelveHour
        }
        set {
            set(newValue.rawValue, forKey: UserDefaultsKeys.timeNotation)
        }
    }

    var unitsNotation: UnitsNotation {
        get {
            let storedValue = integer(forKey: UserDefaultsKeys.unitsNotation)
            return UnitsNotation(rawValue: storedValue) ?? UnitsNotation.metric
        }
        set {
            set(newValue.rawValue, forKey: UserDefaultsKeys.unitsNotation)
        }
    }

    var temperatureNotation: TemperatureNotation {
        get {
            let storedValue = integer(forKey: UserDefaultsKeys.temperatureNotation)
            return TemperatureNotation(rawValue: storedValue) ?? TemperatureNotation.celsius
        }
        set {
            set(newValue.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
        }
    }
}
