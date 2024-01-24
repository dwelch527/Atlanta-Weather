//
//  ContentView.swift
//  Atlanta Weather
//
//  Created by Dylan Welch on 1/19/24.
//

import SwiftUI

struct WeatherView: View {
    @State private var metarData: [MetarData]?

    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()

            VStack(alignment: .center) {
                Text("Atlanta Airport's Current Weather")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    Spacer()
            }

            VStack(alignment: .center, spacing: CGFloat(10)) {
                Image(systemName: "sun.max")
                    .imageScale(.large)
                    .foregroundStyle(.white)
                Text("Temp: \(metarData?.first?.temp ?? 0)° F")
                    .fontWidth(Font.Width(50))
                    .foregroundStyle(.white)
                    .padding()
                Text("Date & Time: \(metarData?.first?.reportTime ?? "")")
                    .foregroundStyle(.white)
                Text("Wind Direction: \(metarData?.first?.windDirection ?? 0)")
                    .foregroundStyle(.white)
                Text("Wind Speed: \(metarData?.first?.windSpeed ?? 0)")
                    .foregroundStyle(.white)
                Text("Pressure: \(metarData?.first?.altim ?? 0)")
                    .foregroundStyle(.white)
                Text("Sea Level Pressure: \(metarData?.first?.seaLevelPressure ?? 0)")
                    .foregroundStyle(.white)
                Text("Elevation: \(metarData?.first?.elevation ?? 0)")
                    .foregroundStyle(.white)
                Text("Latitude: \(metarData?.first?.latitude ?? 0)")
                    .foregroundStyle(.white)
                Text("Longitude: \(metarData?.first?.longitude ?? 0)")
                    .foregroundStyle(.white)
                Text("Visibility: \(metarData?.first?.visibility ?? 0.0)")
                    .foregroundStyle(.white)
                Text("*Current weather for \(metarData?.first?.airportName ?? "")*")
                    .font(.callout)
                    .padding()
            }
        }
        .task {
            do {
                metarData = try await fetchWeatherData()
            } catch MetarError.invalidUrl {
                print("URL is invalid")
            } catch MetarError.invalidResponse {
                print("Response is invalid")
            } catch MetarError.invalidData {
                print("Data is invalid")
            } catch {
                print("Unexpected Error")
            }
        }
    }

    public func fetchWeatherData() async throws -> [MetarData] {
        guard let url = URL(string: WeatherManager.domainUrlString + "/api/data/metar?ids=KATL&format=json") else {
            throw MetarError.invalidUrl
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            print("Error with the response, unexpected status code: \(String(describing: response))")
            throw MetarError.invalidResponse
        }

        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .deferredToDate
            return try decoder.decode([MetarData].self, from: data)
        } catch {
            throw MetarError.invalidData
        }
    }
}

#Preview {
    WeatherView()
}
