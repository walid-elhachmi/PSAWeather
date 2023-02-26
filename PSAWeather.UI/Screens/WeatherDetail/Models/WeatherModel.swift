//
//  WeatherModel.swift
//  PSAWeather.UI
//
//  Created by Walid El Hachmi on 26/2/2023.
//

import Foundation

// MARK: - Weather
struct WeatherModel: Codable {
    let base: String
    let id: Int
    let dt: Int
    let main: Main
    let coordinate: Coordinate
    let wind: Wind
    let sun: Sun
    let weather: [Weather]
    let visibility: Int
    let clouds: Clouds
    let timezone: Int
    let cod: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case base
        case id
        case dt
        case main
        case coordinate = "coord"
        case wind
        case sun = "sys"
        case weather
        case visibility
        case clouds
        case timezone
        case cod
        case name
    }
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coordinate: Codable {
    let long: Double
    let lat: Double
    
    enum CodingKeys: String, CodingKey {
        case long = "lon"
        case lat
    }
}

// MARK: - Main
struct Main: Codable {
    let tempMax: Double
    let humidity: Int
    let feelsLike: Double
    let tempMin: Double
    let temp: Double
    let pressure: Int

    enum CodingKeys: String, CodingKey {
        case tempMax = "temp_max"
        case humidity
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case temp
        case pressure
    }
}

// MARK: - Sys
struct Sun: Codable {
    let id: Int
    let country: String
    let sunset: Int
    let type: Int
    let sunrise: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main: String
    let icon: String
    let description: String
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}
