//
//  CityViewModel.swift
//  PSAWeather.UI
//
//  Created by Walid El Hachmi on 26/2/2023.
//

import PSAWeather_Remote
import Foundation

class CityViewModel {
    private let networkManager: NetworkManager
    private let localCityData = LocalDataManager<City>()

    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
        self.localCityData.load()
    }
    
    func addCity(name: String) {
        let city = localCityData.new()
        city.name = name
        localCityData.save()
    }
    
    func getCities() -> [CityModel] {
        return localCityData.fetch().compactMap { city in
            guard let name = city.name else { return nil }
            return CityModel(name: name)
        }
    }
    
}
