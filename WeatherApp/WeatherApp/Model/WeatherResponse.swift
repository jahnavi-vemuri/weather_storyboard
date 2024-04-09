//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Jahnavi Vemuri on 09/01/24.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Main
    let wind: Wind
    let sys: Sys
    let coord: Coord
    let name: String
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
    let pressure: Int
}

struct Wind: Decodable {
    let speed: Double
}

struct Sys: Decodable {
    let country: String
}

struct Coord: Decodable {
    let lat: Double
    let lon: Double
}

struct Weather: Decodable {
    let main: String
}
