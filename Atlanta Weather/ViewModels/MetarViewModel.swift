//
//  MetarViewModel.swift
//  Atlanta Weather
//
//  Created by Dylan Welch on 1/20/24.
//

import Foundation

class MetarViewModel: ObservableObject {
    let metarData: [MetarData]
    let weatherManager = WeatherManager()

    init(metarData: [MetarData]) {
        self.metarData = metarData
    }
}
