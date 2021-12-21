//
//  WeatherRemoteDataManager.swift
//  WeatherApp
//
//  Created by Silvia Kuzmova on 20.11.21.
//

import Foundation
import Combine

struct WeatherRemoteDataManager: WeatherDataSource {
    func getWeatherData(for latitude: Double, longitude: Double) -> AnyPublisher<[WeatherDayData], Error> {

        let stringURL = Endpoint.BaseURLString + "?lat=\(latitude)&lon=\(longitude)&appid=\(Endpoint.APIKey)&units=metric"
        let url = URL(string: stringURL)!

        print("😄 getting remote data for lat: \(latitude) lon: \(longitude)")

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: WeatherDayDataResponse.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .compactMap { $0.days }
            .eraseToAnyPublisher()
    }
}
