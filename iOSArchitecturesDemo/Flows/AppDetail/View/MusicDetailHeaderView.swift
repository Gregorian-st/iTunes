//
//  MusicDetailHeaderView.swift
//  iOSArchitecturesDemo
//
//  Created by Grigory Stolyarov on 15.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class MusicDetailHeaderView: UIView {
    
    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20.0
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private(set) lazy var trackNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var collectionNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureUI() {
        backgroundColor = .clear
        
        self.addSubview(imageView)
        self.addSubview(trackNameLabel)
        self.addSubview(artistNameLabel)
        self.addSubview(collectionNameLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12.0),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16.0),
            imageView.heightAnchor.constraint(equalToConstant: 120.0),
            imageView.widthAnchor.constraint(equalToConstant: 120.0),
            
            trackNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12.0),
            trackNameLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 16.0),
            trackNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16.0),
            
            artistNameLabel.topAnchor.constraint(equalTo: trackNameLabel.bottomAnchor, constant: 8.0),
            artistNameLabel.leftAnchor.constraint(equalTo: trackNameLabel.leftAnchor),
            artistNameLabel.rightAnchor.constraint(equalTo: trackNameLabel.rightAnchor),
            
            collectionNameLabel.topAnchor.constraint(equalTo:  imageView.bottomAnchor, constant: 12.0),
            collectionNameLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            collectionNameLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16.0),
            collectionNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
