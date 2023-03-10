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
    
    private var isEmptyData: Bool = false {
        didSet {
            if isEmptyData {
                tableView.isHidden = true
                emptyLabel.isHidden = false
            } else {
                tableView.isHidden = false
                emptyLabel.isHidden = true
            }
        }
    }
    
    //@IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var emptyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addCityTapped))
        
        configureDataSource()
        
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.register(cellClass: CityViewCell.self)
        
        isEmptyData = dataSource.data.isEmpty
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    private func configureDataSource() {
        dataSource.data = cityViewModel.getCities()
        dataSource.didSelect = { [weak self] cityName in
            let weatherDetailViewController = WeatherDetailViewController.instantiateFromStoryboard(named: "Main")
            weatherDetailViewController.cityName = cityName
            self?.navigationController?.pushViewController(weatherDetailViewController, animated: true)
        }
    }
    
    @objc
    private func addCityTapped() {
        let alert = UIAlertController(title: "New City", message: "Add a new city name", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self] action in
            
            guard let textField = alert.textFields?.first, let name = textField.text else { return }
            
            self?.dataSource.data.append(CityModel(name: name))
            self?.cityViewModel.addCity(name: name)
            self?.tableView.reloadData()
            self?.isEmptyData = false
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",  style: .cancel)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }

}
