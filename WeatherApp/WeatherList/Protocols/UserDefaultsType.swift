//
//  UserDefaultsType.swift
//  WeatherApp
//
//  Created by Silvia Kuzmova on 20.11.21.
//

import Foundation

protocol UserDefaultsType {

    var timeNotation: TimeNotation { get set }
    var unitsNotation: UnitsNotation { get set }
    var temperatureNotation: TemperatureNotation { get set }

}
