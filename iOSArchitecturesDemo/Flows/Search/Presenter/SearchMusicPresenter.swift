//
//  SearchMusicPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Grigory Stolyarov on 16.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SearchMusicViewInput: class {
    var searchMusicResults: [ITunesSong] { get set }
    func showError(error: Error)
    func hideNoResults()
    func showNoResults()
    func throbber(show: Bool)
}

protocol SearchMusicViewOutput {
    func viewDidSearchMusic(with query: String)
    func viewDidSelectMusic(_ app: ITunesSong)
}

class SearchMusicPresenter {
    
    let interactor: SearchMusicInteractorInput
    let router: SearchMusicRouterInput
    weak var viewInput: SearchMusicViewController?
    
    init(interactor: SearchMusicInteractorInput, router: SearchMusicRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
    private func requestMusic(with query: String) {
        self.interactor.requestMusic(with: query) { [weak self] result in
            guard let self = self else { return }
            
            self.viewInput?.throbber(show: false)
            result
                .withValue { songs in
                    guard !songs.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchMusicResults = songs
                }
                .withError {
                    self.viewInput?.showError(error: $0)
                }
        }
    }
    
}

extension SearchMusicPresenter: SearchMusicViewOutput {
    
    func viewDidSearchMusic(with query: String) {
        self.viewInput?.throbber(show: true)
        requestMusic(with: query)
    }
    
    func viewDidSelectMusic(_ song: ITunesSong) {
        self.router.openMusicDetail(for: song)
    }
    
}
