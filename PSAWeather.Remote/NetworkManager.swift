//
//  NetworkManager.swift
//  PSAWeather.Remote
//
//  Created by Walid El Hachmi on 26/2/2023.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case emptyData
    case decodingError(Error)
}

public class NetworkManager {
    private let urlSession: URLSession
    
    public init() {
        let configuration = URLSessionConfiguration.default
        self.urlSession = URLSession(configuration: configuration)
    }
    
    public func request<T: Codable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    completion(.failure(NetworkError.invalidResponse))
                    return
                }
                
                
                guard let data = data, !data.isEmpty else {
                    completion(.failure(NetworkError.emptyData))
                    return
                }
                
                //Log json retrieved as String
                print(String(decoding: data, as: UTF8.self))
 
                do {
                    let decoder = JSONDecoder()
                    let decodeData = try decoder.decode(T.self, from: data)
                    completion(.success(decodeData))
                } catch {
                    completion(.failure(NetworkError.decodingError(error)))
                }
            }
        }
        
        task.resume()
    }
}
