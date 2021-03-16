//
//  MusicCell.swift
//  iOSArchitecturesDemo
//
//  Created by Grigory Stolyarov on 15.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class MusicCell: UITableViewCell {
    
    // MARK: - Subviews
    
    private(set) lazy var trackNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    private(set) lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - Methods
    
    func configure(with cellModel: MusicCellModel) {
        self.trackNameLabel.text = cellModel.trackName
        self.artistNameLabel.text = cellModel.artistName
    }
    
    // MARK: - UI
    
    override func prepareForReuse() {
        self.trackNameLabel.text = nil
        self.artistNameLabel.text = nil
    }
    
    private func configureUI() {
        self.imageView?.image = UIImage(named: "melody")
        self.addTrackNameLabel()
        self.addArtistNameLabel()
    }
    
    private func addTrackNameLabel() {
        self.contentView.addSubview(self.trackNameLabel)
        NSLayoutConstraint.activate([
            self.trackNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.trackNameLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 72.0),
            self.trackNameLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -12.0)
        ])
    }
    
    private func addArtistNameLabel() {
        self.contentView.addSubview(self.artistNameLabel)
        NSLayoutConstraint.activate([
            self.artistNameLabel.topAnchor.constraint(equalTo: self.trackNameLabel.bottomAnchor, constant: 4.0),
            self.artistNameLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 72.0),
            self.artistNameLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -12.0)
        ])
    }
    
}
