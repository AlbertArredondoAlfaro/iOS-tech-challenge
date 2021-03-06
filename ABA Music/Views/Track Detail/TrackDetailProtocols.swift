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
    func loadTrack(_ track: TrackViewModel)
}

protocol TrackDetailPresenterDelegate : class {
    func viewDidLoad()
    func showInMusicSelected()
}

// Presenter / Router
protocol TrackDetailRouterDelegate : class {
    func showTrackInMusicWithUrl(_ url: URL)
}
