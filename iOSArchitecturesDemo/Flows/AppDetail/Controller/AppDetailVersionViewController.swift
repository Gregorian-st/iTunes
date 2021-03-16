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
    
    private var appDetailVersionView: AppDetailVersionView {
        return self.view as! AppDetailVersionView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
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
        appDetailVersionView.dateLabel.text = app.currentVersionReleaseDateString
        appDetailVersionView.descriptionLabel.text = app.releaseNotes
    }
    
}

