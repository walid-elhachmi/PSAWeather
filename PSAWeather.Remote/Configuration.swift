//
//  Configuration.swift
//  PSAWeather.Remote
//
//  Created by Walid El Hachmi on 26/2/2023.
//

import Foundation


public enum Configuration {
    
    private static let apiKey = "e8517cd167a58a2663f719d9bdb2824e"
    private static let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    
    
    public enum Endpoint {
        case weather(cityName: String)
        
        public var url: URL? {
            switch self {
            case .weather(let cityName):
                let queryParams = [URLQueryItem(name: "q", value: cityName),
                                   URLQueryItem(name: "appid", value: Configuration.apiKey)]
                
                var urlComponents = URLComponents(string: Configuration.baseURL)
                urlComponents?.queryItems = queryParams
                
                return urlComponents?.url
            }
        }
    }
}

