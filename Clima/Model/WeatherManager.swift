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
		performRequest(urlString: urlString)
	}
	
	func performRequest(urlString: String) {
		if let url = URL(string: urlString) {
			
			let session = URLSession(configuration: .default)
			
			let task = session.dataTask(with: url) { data, response, error in
				if error != nil {
					print(error!)
					return
				}
				
				if let safeData = data {
					parseJson(weatherData: safeData)
				}
			}
			
			task.resume()
		}
	}
	
	func parseJson(weatherData: Data) {
		let decoder = JSONDecoder()
		do {
			let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
			let id = decodedData.weather[0].id
			print(getConditionName(weatherId: id))
		} catch {
			print(error)
		}
	}
	
	func getConditionName(weatherId: Int) -> String {
		switch weatherId {
		case 200...232:
			return "cloud.bolt"
		case 300...321:
			return "cloud.drizzle"
		case 500...531:
			return "cloud.rain"
		case 600...622:
			return "cloud.snow"
		case 701...781:
			return "cloud.fog"
		case 800:
			return "sun.max"
		case 801...804:
			return "cloud.bolt"
		default:
			return "cloud"
		}
	}
}
