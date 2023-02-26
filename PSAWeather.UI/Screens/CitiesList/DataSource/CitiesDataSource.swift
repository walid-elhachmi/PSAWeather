//
//  CitiesDataSource.swift
//  PSAWeather.UI
//
//  Created by Walid El Hachmi on 26/2/2023.
//

import UIKit

class CitiesDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    var data: [City] = []
    var didSelect: ((String) -> Void)?

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CityViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(cityName: "Paris")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelect?("Paris")
    }
}
