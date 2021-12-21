//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Silvia Kuzmova on 20.11.21.
//

import Foundation
import Combine

protocol WeatherRepository {
    func getWeatherData(for latitude: Double, longitude: Double) -> AnyPublisher<[WeatherDayData], Error>
}

protocol WeatherDataSource {
    func getWeatherData(for latitude: Double, longitude: Double) -> AnyPublisher<[WeatherDayData], Error>
}

class WeatherDataRepository: WeatherRepository {

    private let remoteDataSource: WeatherDataSource
    private let localDataSource: WeatherDataSource

    public init(remoteDataSource: WeatherDataSource, localDataSource: WeatherDataSource) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }

    func getWeatherData(for latitude: Double, longitude: Double) -> AnyPublisher<[WeatherDayData], Error> {
        // TODO: if no remote data, return local data

        if networkConnection == .offline {

        }

        remoteDataSource.getWeatherData(for: latitude, longitude: longitude)


        return remoteDataSource.getWeatherData(for: latitude, longitude: longitude)

//        return localDataSource.getWeatherData(for: latitude, longitude: longitude)
    }
}








