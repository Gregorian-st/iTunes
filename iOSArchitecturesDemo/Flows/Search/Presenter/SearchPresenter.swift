//
//  SearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Evgenii Semenov on 11.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit
import Alamofire

protocol SearchViewInput: class {
    
    var searchResults: [ITunesApp] { get set }
    var searchMusicResults: [ITunesSong] { get set }
    func showError(error: Error)
    func hideNoResults()
    func showNoResults()
    func throbber(show: Bool)
}

protocol SearchViewOutput {
    func viewDidSearchApp(with query: String)
    func viewDidSelectApp(_ app: ITunesApp)
    func viewDidSearchMusic(with query: String)
    func viewDidSelectMusic(_ app: ITunesSong)
}

class SearchPresenter {
    
    private let searchService = ITunesSearchService()
    
    weak var viewInput: (UIViewController & SearchViewInput)?
    
    private func requestApps(with query: String) {
        self.searchService.getApps(forQuery: query) { [weak self] result in
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
    
    private func openAppDetail(with app: ITunesApp) {
        let appDetailViewController = AppDetailViewController(app: app)
        viewInput?.navigationController?.pushViewController(appDetailViewController, animated: true)
    }
    
    private func requestMusic(with query: String) {
        self.searchService.getSongs(forQuery: query) { [weak self] result in
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
    
    private func openMusicDetail(with song: ITunesSong) {
        let musicDetailViewController = MusicDetailViewController(song: song)
        viewInput?.navigationController?.pushViewController(musicDetailViewController, animated: true)
    }
    
}

extension SearchPresenter: SearchViewOutput {
    
    func viewDidSearchApp(with query: String) {
        self.viewInput?.throbber(show: true)
        requestApps(with: query)
    }
    
    func viewDidSelectApp(_ app: ITunesApp) {
        openAppDetail(with: app)
    }
    
    func viewDidSearchMusic(with query: String) {
        self.viewInput?.throbber(show: true)
        requestMusic(with: query)
    }
    
    func viewDidSelectMusic(_ song: ITunesSong) {
        openMusicDetail(with: song)
    }
    
}
