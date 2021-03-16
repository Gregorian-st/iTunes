//
//  AppStartConfigurator.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppStartManager {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let tabBarVC = UITabBarController()
        let iconApps = UITabBarItem(title: "Apps", image: UIImage(named: "Appstore.png"), selectedImage: UIImage(named: "Appstore.png"))
        let iconMusic = UITabBarItem(title: "Music", image: UIImage(named: "iTunes.png"), selectedImage: UIImage(named: "iTunes.png"))
        
        let appsVC = SearchAppBuilder.build()
        appsVC.navigationItem.title = "Search Apps"
        let navAppsVC = self.configuredNavigationControllerApps
        navAppsVC.viewControllers = [appsVC]
        navAppsVC.tabBarItem = iconApps
        
        let musicVC = SearchMusicBuilder.build()
        musicVC.navigationItem.title = "Search Music"
        let navMusicVC = self.configuredNavigationControllerMusic
        navMusicVC.viewControllers = [musicVC]
        navMusicVC.tabBarItem = iconMusic
        
        tabBarVC.viewControllers = [navAppsVC, navMusicVC]
        tabBarVC.selectedIndex = 0
        
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
    }
    
    private lazy var configuredNavigationControllerApps: UINavigationController = {
        let navVC = UINavigationController()
        navVC.navigationBar.barTintColor = UIColor.systemBlue
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return navVC
    }()
    
    private lazy var configuredNavigationControllerMusic: UINavigationController = {
        let navVC = UINavigationController()
        navVC.navigationBar.barTintColor = UIColor.systemPurple
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return navVC
    }()
    
}
