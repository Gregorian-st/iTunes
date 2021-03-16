//
//  SearchRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Grigory Stolyarov on 16.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SearchRouterInput {
    func openAppDetail(for app: ITunesApp)
    func openMusicDetail(for song: ITunesSong)
}

final class SearchRouter: SearchRouterInput {
    
    weak var viewController: UIViewController?
    
    func openAppDetail(for app: ITunesApp) {
        let appDetailViewController = AppDetailViewController(app: app)
        self.viewController?.navigationController?.pushViewController(appDetailViewController, animated: true)
    }
    
    func openMusicDetail(for song: ITunesSong) {
        let musicDetailViewController = MusicDetailViewController(song: song)
        self.viewController?.navigationController?.pushViewController(musicDetailViewController, animated: true)
    }
    
    
}
