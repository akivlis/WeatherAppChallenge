//
//  Units.swift
//  WeatherApp
//
//  Created by Silvia Kuzmova on 20.11.21.
//

import Foundation

enum TimeNotation: Int {
    case twelveHour
    case twentyFourHour

    var timeFormat: String {
        switch self {
        case .twelveHour: return "hh:mm a"
        case .twentyFourHour: return "HH:mm"
        }
    }
}

enum UnitsNotation: Int {
    case metric
    case imperial
}

enum TemperatureNotation: Int {
    case celsius
    case fahrenheit
}
