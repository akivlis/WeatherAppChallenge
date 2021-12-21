//
//  Endpoint.swift
//  WeatherApp
//
//  Created by Silvia Kuzmova on 20.11.21.
//

import Foundation

struct Endpoint {

    static let APIKey = ""
    static let BaseURL = URL(string: "https://api.openweathermap.org/data/2.5/onecall")!

    static let BaseURLString = "https://api.openweathermap.org/data/2.5/onecall"

    static let BaseIconURL = URL(string: "http://openweathermap.org/img/wn")!

    static var AuthenticatedBaseURL: URL {
        return BaseURL.appendingPathComponent(APIKey)
    }
}

struct Defaults {
    static let Latitude: Double = 48.7164
    static let Longitude: Double = 21.2611
}
