//
//  WeatherDayRow.swift
//  WeatherApp
//
//  Created by Silvia Kuzmova on 20.11.21.
//

import SwiftUI

struct WeatherDayRow: View {

    @State var viewModel: WeatherDayRowViewModel

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text(viewModel.day)
                        .font(.subheadline)
                        .lineLimit(1)
                        .foregroundColor(.orange)
                    Text(viewModel.date)
                        .font(.callout)
                }

                Text(viewModel.description)
                    .font(.footnote)
                    .foregroundColor(.blue)

                HStack {

                    AsyncImage(url: viewModel.iconURL,
                               transaction: Transaction(animation: .spring())) { phase in
                        switch phase {
                        case .empty:
                            Color.gray.opacity(0.1)

                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()

                        case .failure(_):
                            ZStack {
                                Color.gray.opacity(0.1)
                                Text("No image")
                            }
                        @unknown default:
                            Image(systemName: "exclamationmark.icloud")
                        }
                    }
                               .frame(width: 50, height: 50)

                    Text(viewModel.temperature)
                        .lineLimit(1)
                        .font(.headline)

                    Spacer()

                    VStack {
                        Text(viewModel.windSpeed)
                            .font(.callout)

                        Text("Wind")
                            .font(.footnote)
                            .lineLimit(1)
                    }
                    VStack {
                        Text(viewModel.humidity)
                            .font(.callout)

                        Text("Humidity")
                            .font(.footnote)
                            .lineLimit(1)
                    }
                }
            }
        }
        .padding(2)
    }
}

struct WeatherDayView_Previews: PreviewProvider {
    static var previews: some View {
        let dayData = WeatherDayData(time: 1637488800,
                                     windSpeed: 2.13,
                                     humidity: 98,
                                     temperature: Temperature(min: 4.12, max: 11.85, day: 5.0),
                                     weather: [Weather(id: 1,
                                                       main: "cloudy",
                                                       description: "Today is cloudy",
                                                       icon: "cloud.drizzle")])
        let viewModel = WeatherDayRowViewModel(weatherDayData: dayData)
        return WeatherDayRow(viewModel: viewModel)
    }
}
