//
//  SearchInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Grigory Stolyarov on 16.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Alamofire

protocol SearchInteractorInput {
    func requestApps(with query: String, completion: @escaping ( Result<[ITunesApp]> ) -> Void)
    func requestMusic(with query: String, completion: @escaping ( Result<[ITunesSong]> ) -> Void)
}

final class SearchInteractor: SearchInteractorInput {
    
    private let searchService = ITunesSearchService()
    
    func requestApps(with query: String, completion: @escaping( Result<[ITunesApp]> ) -> Void) {
        self.searchService.getApps(forQuery: query, then: completion)
    }
    
    func requestMusic(with query: String, completion: @escaping ( Result<[ITunesSong]> ) -> Void) {
        self.searchService.getSongs(forQuery: query, then: completion)
    }
}
