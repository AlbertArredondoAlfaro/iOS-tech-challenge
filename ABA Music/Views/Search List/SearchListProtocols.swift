//
//  SearchListProtocols.swift
//  ABA Music
//
//  Created by Ricardo Casanova on 19/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import Foundation

// View / Presenter
protocol SearchListViewInjection : class {
    func showProgress(_ show: Bool, status: String)
    func showProgress(_ show: Bool)
    func showMessageWith(title: String, message: String, actionTitle: String)
}

protocol SearchListPresenterDelegate : class {
    func viewDidLoad()
    func searchArtist(_ artist: String?)
    func artistSelectedAt(_ index: Int)
}

// Presenter / Interactor

protocol SearchListInteractorDelegate : class {
}

// Presenter / Router
protocol SearchListRouterDelegate : class {
}
