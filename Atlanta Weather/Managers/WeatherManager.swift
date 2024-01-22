//
//  WeatherManager.swift
//  Atlanta Weather
//
//  Created by Dylan Welch on 1/19/24.
//

import Foundation
import WeatherKit
import CoreLocation

final class WeatherManager {
    static let shared = WeatherManager()
    static let domainUrlString = "https://aviationweather.gov"
}

enum MetarError: Error {
    case invalidUrl
    case invalidResponse
    case invalidData
}
