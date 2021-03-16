//
//  SearchMusicRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Grigory Stolyarov on 16.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SearchMusicRouterInput {
    func openMusicDetail(for song: ITunesSong)
}

final class SearchMusicRouter: SearchMusicRouterInput {
    
    weak var viewController: UIViewController?
    
    func openMusicDetail(for song: ITunesSong) {
        let musicDetailViewController = MusicDetailViewController(song: song)
        self.viewController?.navigationController?.pushViewController(musicDetailViewController, animated: true)
    }
    
}
