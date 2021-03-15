//
//  AppDetailVersionViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Grigory Stolyarov on 15.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailVersionViewController: UIViewController {
    
    private let app: ITunesApp
    private let dateFormatter = DateFormatter()
    
    private var appDetailVersionView: AppDetailVersionView {
        return self.view as! AppDetailVersionView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
        dateFormatter.dateFormat = "dd.MM.yyyy"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = AppDetailVersionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        congureUI()
    }
    
    private func congureUI() {
        appDetailVersionView.versionLabel.text = "Версия \(app.appVersion ?? "")"
        if let date = app.currentVersionReleaseDate {
            appDetailVersionView.dateLabel.text = dateFormatter.string(from: date)
        } else {
            appDetailVersionView.dateLabel.text = ""
        }
        appDetailVersionView.descriptionLabel.text = app.releaseNotes
    }
    
}

