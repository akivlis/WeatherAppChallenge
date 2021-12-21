//
//  WeatherDayDetailView.swift
//  WeatherApp
//
//  Created by Silvia Kuzmova on 20.11.21.
//

import SwiftUI

struct WeatherDayDetailView: View {

    let dayData: WeatherDayData

    var body: some View {
        Text(dayData.date.description)
    }
}

//struct WeatherDayDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        let dayData = WeatherDayData(date: Date(),
//                                     icon: "exclamationmark.icloud",
//                                     windSpeed: 2.2,
//                                     humidity: 85,
//                                     temperatureMin: 20,
//                                     temperatureMax: 25)
//        return WeatherDayDetailView(dayData: dayData)
//    }
//}
