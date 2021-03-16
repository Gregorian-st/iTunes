//
//  MusicCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Grigory Stolyarov on 15.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

struct MusicCellModel {
    let trackName: String
    let artistName: String?
}

final class MusicCellModelFactory {
    
    static func cellModel(from model: ITunesSong) -> MusicCellModel {
        return MusicCellModel(trackName: model.trackName,
                              artistName: model.artistName)
    }
    
}
