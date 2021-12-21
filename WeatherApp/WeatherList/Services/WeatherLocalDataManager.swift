//
//  WeatherLocalDataManager.swift
//  WeatherApp
//
//  Created by Silvia Kuzmova on 20.11.21.
//

import Foundation
import Combine

struct WeatherLocalDataManager: WeatherDataSource {

    func getWeatherData(for latitude: Double, longitude: Double) -> AnyPublisher<[WeatherDayData], Error> {
        let localData = PassthroughSubject<[WeatherDayData], Error>()

        // TODO: get locally stored data
//        let weatherData = realm.objects(WeatherDayData.self)

        return localData.eraseToAnyPublisher()
    }

    func store(weatherData: [WeatherDayData]) {
        // TODO: store weatherData on local DB, for example Realm

//        do {
//            try realm.write {
//                realm.add(weatherData, update: true)
//            }
//        } catch let error as NSError {
//        }
    }
}
