//
//  SearchMusicBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Grigory Stolyarov on 16.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SearchMusicBuilder {
    
    static func build() -> SearchMusicViewController {
        let router = SearchMusicRouter()
        let interactor = SearchMusicInteractor()
        let presenter = SearchMusicPresenter(interactor: interactor, router: router)
        let viewController = SearchMusicViewController(presenter: presenter)
        
        presenter.viewInput = viewController
        router.viewController = viewController
        
        return viewController
    }
    
}
