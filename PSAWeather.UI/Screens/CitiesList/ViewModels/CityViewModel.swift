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
    
    var cities: [City] = []
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
}
