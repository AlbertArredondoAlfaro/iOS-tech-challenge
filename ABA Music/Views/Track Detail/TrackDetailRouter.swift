//
//  TrackDetailRouter.swift
//  ABA Music
//
//  Created by Ricardo Casanova on 20/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import Foundation

class TrackDetailRouter {
    
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    
    public static func setupModuleWithTrack(_ track: ArtistViewModel) -> TrackDetailViewController {
        let trackDetailVC = TrackDetailViewController()
        trackDetailVC.presenter = TrackDetailPresenter(view: trackDetailVC, track: track)
        return trackDetailVC
    }
    
}

extension TrackDetailRouter: TrackDetailRouterDelegate {
}
