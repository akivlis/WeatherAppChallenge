//
//  WeatherDayRowViewModel.swift
//  WeatherApp
//
//  Created by Silvia Kuzmova on 20.11.21.
//

import Foundation

struct WeatherDayRowViewModel {

    // MARK: - Properties

    let weatherDayData: WeatherDayData

    private let userDefaults: UserDefaultsType
    private let dateFormatter = DateFormatter()


    init(weatherDayData: WeatherDayData,
         userDefaults: UserDefaultsType = UserDefaults.standard) {
        self.weatherDayData = weatherDayData
        self.userDefaults = userDefaults
    }

    var iconURL: URL? {
        guard let icon = weatherDayData.weather.first?.icon else { return nil }
        let iconString = "\(icon)@2x.png"
        return Endpoint.BaseIconURL.appendingPathComponent(iconString)
    }

    var day: String {
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: weatherDayData.date)
    }

    var date: String {
        dateFormatter.dateFormat = "MMMM d"
        return dateFormatter.string(from: weatherDayData.date)
    }

    var description: String {
        return weatherDayData.weather.first?.description.capitalized ?? ""
    }

    var temperature: String {
        return format(temperature: weatherDayData.temperature.day)
    }

    var windSpeed: String {
        let windSpeed = weatherDayData.windSpeed

        switch userDefaults.unitsNotation {
        case .imperial:
            return String(format: "%.f MPH", windSpeed.toMPH())
        case .metric:
            return String(format: "%.f KPH", windSpeed)
        }
    }

    var humidity: String {
        return String(format: "%.f %", weatherDayData.humidity) + "%"
    }

    // MARK: - Private

    private func format(temperature: Double) -> String {
        switch userDefaults.temperatureNotation {
        case .fahrenheit:
            return String(format: "%.0f °F", temperature.toFahrenheit())
        case .celsius:
            return String(format: "%.0f °C", temperature)
        }
    }
    
}

extension Double {

    func toFahrenheit() -> Double {
        return ((self + 32.0) * 1.8)
    }

    func toMPH() -> Double {
        return (self / 1.609344)
    }

}
