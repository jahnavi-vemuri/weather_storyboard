//
//  WeatherNetworkManager.swift
//  WeatherApp
//
//  Created by Jahnavi Vemuri on 09/01/24.
//

import Alamofire
import Foundation

class WeatherNetworkManager {
    static let shared = WeatherNetworkManager()

    private init() {}

    func fetchWeather(city: String, completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        var nsDictionary: NSDictionary?
        if let url = Bundle.main.path(forResource: "Info", ofType: "plist") {
            nsDictionary = NSDictionary(contentsOfFile: url)
        }
        var baseURL = ""
        if let dict = nsDictionary {
            baseURL = dict["BASE_URL"] as? String ?? ""
        }
        var apiKey = ""
        if let dict = nsDictionary {
            apiKey = dict["API_KEY"] as? String ?? ""
        }
        let url = "\(baseURL)weather?q=\(city)&appid=\(apiKey)"
        
        AF.request(url).responseDecodable(of: WeatherResponse.self) { response in
            switch response.result {
            case .success(let weatherResponse):
                completion(.success(weatherResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
