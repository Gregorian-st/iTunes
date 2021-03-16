//
//  SearchAppPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Evgenii Semenov on 11.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SearchAppViewInput: class {
    var searchResults: [ITunesApp] { get set }
    func showError(error: Error)
    func hideNoResults()
    func showNoResults()
    func throbber(show: Bool)
}

protocol SearchAppViewOutput {
    func viewDidSearchApp(with query: String)
    func viewDidSelectApp(_ app: ITunesApp)
}

class SearchAppPresenter {
    
    let interactor: SearchAppInteractorInput
    let router: SearchAppRouterInput
    weak var viewInput: (UIViewController & SearchAppViewInput)?
    
    init(interactor: SearchAppInteractorInput, router: SearchAppRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
    private func requestApps(with query: String) {
        self.interactor.requestApps(with: query) { [weak self] result in
            guard let self = self else { return }
            
            self.viewInput?.throbber(show: false)
            result
                .withValue { apps in
                    guard !apps.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = apps
                }
                .withError {
                    self.viewInput?.showError(error: $0)
                }
        }
    }
    
}

extension SearchAppPresenter: SearchAppViewOutput {
    
    func viewDidSearchApp(with query: String) {
        self.viewInput?.throbber(show: true)
        requestApps(with: query)
    }
    
    func viewDidSelectApp(_ app: ITunesApp) {
        self.router.openAppDetail(for: app)
    }
    
}
