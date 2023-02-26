//
//  CitiesViewController.swift
//  PSAWeather.UI
//
//  Created by Walid El Hachmi on 26/2/2023.
//

import UIKit

class CitiesViewController: UIViewController {
    
    //Instance properties
    private var cityViewModel = CityViewModel()
    private let dataSource = CitiesDataSource()
    
    //@IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addCityTapped))
        
        dataSource.data = cityViewModel.getCities()
        dataSource.didSelect = { [weak self] cityName in
            let weatherDetailViewController = WeatherDetailViewController.instantiateFromStoryboard(named: "Main")
            weatherDetailViewController.cityName = cityName
            self?.navigationController?.pushViewController(weatherDetailViewController, animated: true)
        }
        
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.register(cellClass: CityViewCell.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    @objc
    private func addCityTapped() {
        let alert = UIAlertController(title: "New City", message: "Add a new city name", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self] action in
            
            guard let textField = alert.textFields?.first, let name = textField.text else { return }
            
            self?.dataSource.data.append(CityModel(name: name))
            self?.cityViewModel.addCity(name: name)
            self?.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",  style: .cancel)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }

}
