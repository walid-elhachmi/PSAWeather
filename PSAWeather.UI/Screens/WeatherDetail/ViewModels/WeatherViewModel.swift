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
    private var weather: Weather?
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func get() {
        guard let url = Configuration.Endpoint.weather(cityName: "paris").url else { return }
        networkManager.request(url: url) { (result: Result<Weather, Error>) in
            switch result {
            case .success(let weather):
                self.weather = weather
            case .failure(let error):
                print("⚠️ Error", error.localizedDescription)
            }
        }
    }
}
