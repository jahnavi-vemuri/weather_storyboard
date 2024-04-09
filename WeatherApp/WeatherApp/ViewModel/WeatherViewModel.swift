//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Jahnavi Vemuri on 09/01/24.
//

// WeatherViewModel.swift
// WeatherViewModel.swift
import Foundation

class WeatherViewModel {
    var weather: WeatherResponse?

    init() {}

    func fetchWeather(city: String, completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        WeatherNetworkManager.shared.fetchWeather(city: city) { result in
            switch result {
            case .success(let weatherResponse):
                self.weather = weatherResponse
                completion(.success(weatherResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
