//
//  SearchMusicInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Grigory Stolyarov on 16.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Alamofire

protocol SearchMusicInteractorInput {
    func requestMusic(with query: String, completion: @escaping ( Result<[ITunesSong]> ) -> Void)
}

final class SearchMusicInteractor: SearchMusicInteractorInput {
    
    private let searchService = ITunesSearchService()
    
    func requestMusic(with query: String, completion: @escaping ( Result<[ITunesSong]> ) -> Void) {
        self.searchService.getSongs(forQuery: query, then: completion)
    }
}
