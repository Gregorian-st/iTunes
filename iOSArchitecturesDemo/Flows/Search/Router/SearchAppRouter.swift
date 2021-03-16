//
//  SearchAppRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Grigory Stolyarov on 16.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SearchAppRouterInput {
    func openAppDetail(for app: ITunesApp)
}

final class SearchAppRouter: SearchAppRouterInput {
    
    weak var viewController: UIViewController?
    
    func openAppDetail(for app: ITunesApp) {
        let appDetailViewController = AppDetailViewController(app: app)
        self.viewController?.navigationController?.pushViewController(appDetailViewController, animated: true)
    }
    
}
