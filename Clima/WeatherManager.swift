//
//  WeatherManager.swift
//  Clima
//
//  Created by Tatjana Urvan on 02/10/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
	let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=fa33900a785e3a449680499dae5bfa12&units=metric"
	
	func fetchWeather(cityName: String) {
		let urlString = "\(weatherURL)&q=\(cityName)"
	}
	
	
}
