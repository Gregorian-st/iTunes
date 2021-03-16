//
//  SearchAppInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Grigory Stolyarov on 16.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Alamofire

protocol SearchAppInteractorInput {
    func requestApps(with query: String, completion: @escaping ( Result<[ITunesApp]> ) -> Void)
}

final class SearchAppInteractor: SearchAppInteractorInput {
    
    private let searchService = ITunesSearchService()
    
    func requestApps(with query: String, completion: @escaping( Result<[ITunesApp]> ) -> Void) {
        self.searchService.getApps(forQuery: query, then: completion)
    }
    
}
