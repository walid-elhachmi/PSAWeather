//
//  AppDelegate.swift
//  PSAWeather.UI
//
//  Created by Walid El Hachmi on 25/2/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let citiesViewController = CitiesViewController.instantiateFromStoryboard(named: "Main")
        navigationController = UINavigationController(rootViewController: citiesViewController)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
        
        
        return true
    }

}

