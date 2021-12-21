//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Silvia Kuzmova on 20.11.21.
//

import SwiftUI
import CoreLocationUI


struct WeatherView: View {

    @ObservedObject var viewModel : WeatherViewModel

    @StateObject var locationManager = LocationManager()

    var body: some View {
        NavigationView {
            List(viewModel.weatherDays) { weatherDay in
                NavigationLink(destination: WeatherDayDetailView(dayData: weatherDay)) {
                    WeatherDayRow(viewModel: WeatherDayRowViewModel(weatherDayData: weatherDay))
                }
                //.animation(CASpringAnimation, value: <#T##Equatable#>)
            }
            .listStyle(PlainListStyle())
            .refreshable {
                if let location = locationManager.location {
                    viewModel.fetchWeatherData(for: location)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle(locationManager.location == nil ? "Getting location..." : "This Week")
            .toolbar {
                Button(action: {

                }) {
                    Image(systemName: "plus")
                        .font(.title)
                        .foregroundColor(.orange)
                }
            }
            .onAppear {
                if let location = locationManager.location {
                    viewModel.fetchWeatherData(for: location)
                } else {
                    locationManager.requestLocation()
                }
            }
            .onChange(of: locationManager.location) { location in
                viewModel.fetchWeatherData(for: location)
            }
        }
    }
}

struct WetherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeatherViewModel())
    }
}
