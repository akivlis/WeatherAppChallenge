//
//  WeatherViewViewModel.swift
//  WeatherApp
//
//  Created by Silvia Kuzmova on 20.11.21.
//

import Foundation
import SwiftUI
import Combine
import CoreLocation
import CoreLocationUI

class WeatherViewModel: ObservableObject {

    @Published var weatherDays : [WeatherDayData] = []

    private let weatherRepository: WeatherRepository
    private var cancellables = Set<AnyCancellable>()

    private var currentLocation: Location? {
        didSet {
            fetchWeatherData(for: currentLocation)
        }
    }

    // MARK: - Init

    init(weatherRepository: WeatherRepository = WeatherDataRepository(remoteDataSource: WeatherRemoteDataManager(), localDataSource: WeatherRemoteDataManager())) {
        self.weatherRepository = weatherRepository
    }

    func fetchWeatherData(for location: Location?) {
        guard let location = location else {
            print("No location detected")
            return
        }

        weatherRepository.getWeatherData(for: location.lat, longitude: location.lon)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("😈" + String(describing: error))
                }
            }, receiveValue: { weatherDays in
                self.weatherDays = weatherDays
            })
            .store(in: &cancellables)
    }

}
