//
//  WeatherData.swift
//  Clima
//
//  Created by Tatjana Urvan on 14/11/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
	let name: String
	let main: Main
	let weather: [Weather]
}

struct Main: Decodable {
	let temp: Double
}

struct Weather: Decodable {
	let description: String
	let id: Int
}
