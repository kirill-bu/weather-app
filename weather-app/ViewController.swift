//
//  ViewController.swift
//  weather-app
//
//  Created by KiriLL on 20.11.2025.
//

import UIKit
import MapKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		searchCity(cityName: "Novosibirsk")
	}

	private func searchCity(cityName: String) {
		let request = MKLocalSearch.Request()
		request.naturalLanguageQuery = cityName
		request.resultTypes = [.address]

		let search = MKLocalSearch(request: request)
		search.start { response, error in
			if let error = error {
				print("Search error: \(error.localizedDescription)")
				return
			}

			guard let mapItem = response?.mapItems.first else {
				print("No results found for city \(cityName)")
				return
			}

			let coordinate = mapItem.location.coordinate
			let city = mapItem.name ?? "City not identified"

			print("Input city: \(cityName)")
			print("Found city: \(city)")
			print("Coordinates: \(coordinate.latitude), \(coordinate.longitude)")
		}
	}
}
