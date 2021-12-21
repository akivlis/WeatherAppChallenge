//
//  WeatherDayData.swift
//  WeatherApp
//
//  Created by Silvia Kuzmova on 20.11.21.
//

import Foundation

struct WeatherDayData: Codable, Identifiable {

    var id = UUID()
    let time: Double
    let windSpeed: Double
    let humidity: Double
    let temperature: Temperature
    let weather: [Weather]

    var date: Date {
        return Date(timeIntervalSince1970: time)
    }

    enum CodingKeys: String, CodingKey {
        case time = "dt"
        case windSpeed = "wind_speed"
        case humidity
        case temperature = "temp"
        case weather
    }
}

struct Temperature: Codable {
    let min: Double
    let max: Double
    let day: Double
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct WeatherDayDataResponse: Codable {
    let days: [WeatherDayData]
    let latitude: Double
    let longitude: Double

    enum CodingKeys: String, CodingKey {
        case days = "daily"
        case latitude = "lat"
        case longitude = "lon"
    }
}
