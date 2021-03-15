//
//  MusicDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Grigory Stolyarov on 15.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class MusicDetailViewController: UIViewController {
    
    public var song: ITunesSong
    
    lazy var headerDetailViewController = MusicDetailHeaderViewController(song: song)
    
    init(song: ITunesSong) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.configureNavigationController()
        
        addHeaderViewController()
    }
    
    // MARK: - Private
    
    private func configureNavigationController() {
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func addHeaderViewController() {
        view.addSubview(headerDetailViewController.view)
        addChild(headerDetailViewController)
        
        headerDetailViewController.didMove(toParent: self)
        
        headerDetailViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerDetailViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerDetailViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            headerDetailViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
    
}
