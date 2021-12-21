//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Silvia Kuzmova on 20.11.21.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            WeatherView(viewModel: WeatherViewModel())
        }
    }
}
