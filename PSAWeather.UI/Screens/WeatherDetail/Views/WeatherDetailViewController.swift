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
    
    //@IBOutlets
    @IBOutlet private weak var cityNameLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var iconImage: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = .white
        
        // Create a gradient layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.cyan.cgColor]
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        updateUI()
    }
    
    private func updateUI() {
        weatherViewModel.getWeather { success, message in
            DispatchQueue.main.async {
                if success {
                    self.cityNameLabel.text = self.weatherViewModel.cityName
                    self.temperatureLabel.text = self.weatherViewModel.temperature
                    self.iconImage.image = UIImage(named: self.weatherViewModel.iconName)
                    self.descriptionLabel.text = self.weatherViewModel.description
                } else {
                    let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
}
