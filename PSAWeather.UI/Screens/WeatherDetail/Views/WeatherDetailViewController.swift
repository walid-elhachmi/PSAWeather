//
//  WeatherDetailViewController.swift
//  PSAWeather.UI
//
//  Created by Walid El Hachmi on 26/2/2023.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    //Instance properties
    private var weatherViewModel = WeatherViewModel()
    
    private let colors = [UIColor.blue.cgColor, UIColor.cyan.cgColor]
    private let startPoint = CGPoint(x: 1, y: 0)
    private let endPoint = CGPoint(x: 0, y: 1)
    
    var cityName: String?
    
    //@IBOutlets
    @IBOutlet private weak var cityNameLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var iconImage: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    @IBOutlet private weak var temperatureMaxLabel: UILabel!
    @IBOutlet private weak var temperatureMinLabel: UILabel!
    
    @IBOutlet private weak var humidityLabel: UILabel!
    @IBOutlet private weak var pressureLabel: UILabel!
    
    @IBOutlet private weak var sunriseLabel: UILabel!
    @IBOutlet private weak var sunsetLabel: UILabel!
    
    @IBOutlet private weak var windSpeedLabel: UILabel!
    @IBOutlet private weak var windDegreeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.gradient(colors: colors, startPoint: startPoint, endPoint: endPoint)
        updateView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    private func updateView() {
        guard let cityName = self.cityName else { return }
        
        weatherViewModel.getWeather(cityName: cityName) { success, message in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                if success {
                    self.cityNameLabel.text = self.weatherViewModel.cityName
                    self.temperatureLabel.text = self.weatherViewModel.temperature
                    self.iconImage.image = UIImage(named: self.weatherViewModel.iconName)
                    self.descriptionLabel.text = self.weatherViewModel.description
                    
                    self.temperatureMaxLabel.text = self.weatherViewModel.temperatureMax
                    self.temperatureMinLabel.text = self.weatherViewModel.temperatureMin
                    
                    self.humidityLabel.text = self.weatherViewModel.humidity
                    self.pressureLabel.text = self.weatherViewModel.pressure
                    
                    self.sunriseLabel.text = self.weatherViewModel.sunrise
                    self.sunsetLabel.text = self.weatherViewModel.sunset
                    
                    self.windSpeedLabel.text = self.weatherViewModel.windSpeed
                    self.windDegreeLabel.text = self.weatherViewModel.windDegree
                    
                } else {
                    let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
                    
                    let cancelAction = UIAlertAction(title: "OK", style: .cancel) { _ in
                        self.navigationController?.popViewController(animated: true)
                    }

                    alert.addAction(cancelAction)
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
}
