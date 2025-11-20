//
//  ViewController.swift
//  weather-app
//
//  Created by KiriLL on 20.11.2025.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		convertCityToCoordinates(cityName: "Novosibirsk")
	}

	private func convertCityToCoordinates(cityName: String) {
		let geocoder = CLGeocoder()

		geocoder.geocodeAddressString(cityName) { placemarks, error in
			if let error = error {
				print("Failed to geocode city \(cityName): \(error.localizedDescription)")
				return
			}

			guard let placemark = placemarks?.first,
				  let location = placemark.location else {
						print("No coordinates found for city \(cityName)")
						return
			}

			let latitude = location.coordinate.latitude
			let longitude = location.coordinate.longitude
			
			// город из placemark.locality
			let foundCity = placemark.locality ?? "City not identified"

			print("Input city: \(cityName)")
			print("Found city: \(foundCity)")
			print("Coordinates: \(latitude), \(longitude)")
		}
	}
}
