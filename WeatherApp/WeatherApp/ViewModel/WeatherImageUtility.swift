//
//  WeatherImageUtility.swift
//  WeatherApp
//
//  Created by Jahnavi Vemuri on 10/01/24.
//

import UIKit

class WeatherImageUtility {
    static func getImageForWeatherCondition(_ weatherCondition: String) -> UIImage? {
        switch weatherCondition {
        case "Clear Sky", "Sunny":
            return UIImage(named: "sunny")
        case "Clouds":
            return UIImage(named: "cloudy")
        case "Rain", "Drizzle", "Thunderstorm":
            return UIImage(named: "rainy")
        case "Snow", "Fog", "Mist", "Haze":
            return UIImage(named: "snowy")
        default:
            return UIImage(named: "sunny")
        }
    }
}
