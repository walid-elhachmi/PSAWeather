//
//  WeatherViewModel.swift
//  PSAWeather.UI
//
//  Created by Walid El Hachmi on 26/2/2023.
//

import PSAWeather_Remote
import Foundation

class WeatherViewModel {
    private let networkManager: NetworkManager
    private var weatherModel: WeatherModel?

    var cityName: String {
        return weatherModel?.name ?? "-"
    }
    
    var temperature: String {
        if let temp = weatherModel?.main.temp {
            return String(format: "%.0f°", temp)
        }
        return "-°"
    }
    
    var iconName: String {
        return weatherModel?.weather.first?.icon ?? ""
    }
    
    var description: String {
        return weatherModel?.weather.first?.description ?? "-"
    }
    
    var temperatureMax: String {
        if let temp = weatherModel?.main.tempMax {
            return "Max: " + String(format: "%.0f°", temp)
        }
        return "Max: -°"
    }
    
    var temperatureMin: String {
        if let temp = weatherModel?.main.tempMin {
            return "Min: " + String(format: "%.0f°", temp)
        }
        return "Min: -°"
    }
    
    var humidity: String {
        if let humidity = weatherModel?.main.humidity {
            return "Humidity: " + String(format: "%.0f", humidity) + "%"
        }
        return "Humidity: -°"
    }
    
    var pressure: String {
        if let pressure = weatherModel?.main.pressure {
            return "Pressure: " + String(format: "%.0f", pressure) + " mb"
        }
        return "Pressure: -°"
    }
    
    var sunrise: String {
        if let sunrise = weatherModel?.sun.sunrise {
            return "Sunrise: " + format(timestamp: sunrise)
        }
        return "Sunrise : -"
    }
    
    var sunset: String {
        if let sunset = weatherModel?.sun.sunset {
            return "Sunset: " + format(timestamp: sunset)
        }
        return "Sunset : -"
    }
    
    var windSpeed: String {
        if let speed = weatherModel?.wind.speed {
            return "Speed: " + String(format: "%.0f", speed) + " km/h"
        }
        return "Speed : -"
    }
    
    var windDegree: String {
        if let deg = weatherModel?.wind.deg {
            return "Degree: " + String(format: "%.0f°", deg)
        }
        return "Degree : -°"
    }
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func getWeather(cityName: String, completion: @escaping (_ success: Bool, _ message: String?) -> Void) {
        guard let url = Configuration.Endpoint.weather(cityName.lowercased()).url else {
            completion(false, "Url request not found")
            return
        }
        networkManager.request(url: url) { [weak self] (result: Result<WeatherModel, Error>) in
            switch result {
            case .success(let weatherModel):
                self?.weatherModel = weatherModel
                completion(true, nil)
            case .failure(let error):
                completion(false, error.localizedDescription)
            }
        }
    }
    
    private func format(timestamp: Double) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: date)
    }
}
