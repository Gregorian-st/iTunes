//
//  MusicDetailHeaderViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Grigory Stolyarov on 15.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class MusicDetailHeaderViewController: UIViewController {
    
    private let song: ITunesSong
    
    private let imageDownloader = ImageDownloader()
    
    private var musicDetailHeaderView: MusicDetailHeaderView {
        return self.view as! MusicDetailHeaderView
    }
    
    init(song: ITunesSong) {
        self.song = song
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = MusicDetailHeaderView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        congureUI()
    }
    
    private func congureUI() {
        downloadImage()
        musicDetailHeaderView.trackNameLabel.text = song.trackName
        musicDetailHeaderView.artistNameLabel.text = "Artist: " + (song.artistName ?? "")
        musicDetailHeaderView.collectionNameLabel.text = "Album:\n" + (song.collectionName ?? "")
    }
    
    private func downloadImage() {
        guard let url = self.song.artwork else { return }
        
        self.imageDownloader.getImage(fromUrl: url) { [weak self] (image, error) in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.musicDetailHeaderView.imageView.image = image
            }
        }
    }
    
}
