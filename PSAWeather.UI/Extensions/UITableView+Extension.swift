//
//  UITableView+Extension.swift
//  PSAWeather.UI
//
//  Created by Walid El Hachmi on 26/2/2023.
//

import Foundation

import UIKit

extension UITableView {
    
    func register<Cell: UITableViewCell>(cellClass: Cell.Type) {
        let reuseIdentifier = String(describing: cellClass)
        let cellNib = UINib(nibName: reuseIdentifier, bundle: nil)
        self.register(cellNib, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func dequeueReusableCell<Cell: UITableViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: Cell.self), for: indexPath) as? Cell else {
            fatalError("Failed to dequeue cell of type \(Cell.self)")
        }
        return cell
    }
}
