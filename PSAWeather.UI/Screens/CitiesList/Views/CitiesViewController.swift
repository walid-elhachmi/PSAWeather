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

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        
        dataSource.didSelect = { [weak self] city in
            let weatherDetailViewController = WeatherDetailViewController.instantiateFromStoryboard(named: "Main")
            self?.navigationController?.pushViewController(weatherDetailViewController, animated: true)
        }
        
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.register(cellClass: CityViewCell.self)
    }
    
    @objc
    private func addTapped() {
        print("Add Tapped")
    }

}
