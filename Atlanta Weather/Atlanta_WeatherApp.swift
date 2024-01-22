//
//  Atlanta_WeatherApp.swift
//  Atlanta Weather
//
//  Created by Dylan Welch on 1/19/24.
//

import SwiftUI

@main
struct Atlanta_WeatherApp: App {
    let metarViewModel = MetarViewModel(metarData: [])

    var body: some Scene {
        WindowGroup {
            WeatherView().environmentObject(metarViewModel)
        }
    }
}
