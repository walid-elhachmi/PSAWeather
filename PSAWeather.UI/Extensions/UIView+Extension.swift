//
//  UIView+Extension.swift
//  PSAWeather.UI
//
//  Created by Walid El Hachmi on 26/2/2023.
//

import UIKit

extension UIView {
    
    // Add a gradient layer
    func gradient(colors: [CGColor], startPoint: CGPoint, endPoint: CGPoint) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors//[UIColor.blue.cgColor, UIColor.cyan.cgColor]
        gradientLayer.startPoint = startPoint//CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = endPoint//CGPoint(x: 0, y: 1)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    // Add a shadow layer
    func setShadow(radius: CGFloat = 4, opacity: Float = 0.1, offset: CGSize = CGSize(width: 0, height: 4)) {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
    }
}
