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
        return weatherModel?.name ?? ""
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
        return weatherModel?.weather.first?.description ?? ""
    }
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func getWeather(completion: @escaping (_ success: Bool, _ message: String?) -> Void) {
        guard let url = Configuration.Endpoint.weather("paris").url else {
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
}
