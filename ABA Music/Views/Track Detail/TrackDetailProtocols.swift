//
//  TrackDetailProtocols.swift
//  ABA Music
//
//  Created by Ricardo Casanova on 20/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import Foundation

// View / Presenter
protocol TrackDetailViewInjection : class {
    func loadTrack(_ track: ArtistViewModel)
}

protocol TrackDetailPresenterDelegate : class {
    func viewDidLoad()
}

// Presenter / Interactor

protocol TrackDetailInteractorDelegate : class {
}

// Presenter / Router
protocol TrackDetailRouterDelegate : class {
}
