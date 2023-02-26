//
//  CityViewCell.swift
//  PSAWeather.UI
//
//  Created by Walid El Hachmi on 26/2/2023.
//

import UIKit

class CityViewCell: UITableViewCell {

    @IBOutlet weak var labelContainer: UIView!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        labelContainer.layer.cornerRadius = 8
        labelContainer.setShadow()
    }

    func configure(cityName: String) {
        self.cityNameLabel.text = cityName
    }
    
}
