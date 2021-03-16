//
//  SearchBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Evgenii Semenov on 11.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SearchBuilder {
    
    static func build(mediaType: MediaType) -> (UIViewController & SearchViewInput) {
        let router = SearchRouter()
        let interactor = SearchInteractor()
        let presenter = SearchPresenter(interactor: interactor, router: router)
        
        switch mediaType {
        case .apps:
            let viewController = SearchViewController(presenter: presenter)
            presenter.viewInput = viewController
            router.viewController = viewController
            return viewController
        case .music:
            let viewController = SearchMusicViewController(presenter: presenter)
            presenter.viewInput = viewController
            router.viewController = viewController
            return viewController
        }
    }
}
