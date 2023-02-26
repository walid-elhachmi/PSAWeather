//
//  CitiesViewController.swift
//  PSAWeather.UI
//
//  Created by Walid El Hachmi on 26/2/2023.
//

import UIKit

class CitiesViewController: UIViewController, UITableViewDataSource {
    
    //Instance properties
    private var cityViewModel = CityViewModel()
    
    //@IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        return UITableViewCell()
        
    }
    
    @objc
    private func addTapped() {
        print("Add Tapped")
    }

}
