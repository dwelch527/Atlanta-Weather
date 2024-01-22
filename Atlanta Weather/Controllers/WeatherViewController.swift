//
//  WeatherViewController.swift
//  Atlanta Weather
//
//  Created by Dylan Welch on 1/19/24.
//

import UIKit

class WeatherViewController: UIViewController {
    private let primaryView = WeatherView()

    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveLocation()
    }

    private func retrieveLocation() {
        LocationManager.shared.acquireCurrentLocation { location in
            print(String(describing: location))
        }
    }
}
