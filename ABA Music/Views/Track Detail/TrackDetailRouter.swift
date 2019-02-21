//
//  TrackDetailRouter.swift
//  ABA Music
//
//  Created by Ricardo Casanova on 20/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import Foundation
import SafariServices

class TrackDetailRouter {
    
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    
    public static func setupModuleWithTrack(_ track: ArtistViewModel, navigationController: UINavigationController?) -> TrackDetailViewController {
        let trackDetailVC = TrackDetailViewController()
        trackDetailVC.presenter = TrackDetailPresenter(view: trackDetailVC, track: track, navigationController: navigationController)
        return trackDetailVC
    }
    
}

extension TrackDetailRouter: TrackDetailRouterDelegate {
    
    func showTrackInItunesWithUrl(_ url: URL) {
        let safariVC = SFSafariViewController(url: url)
        navigationController?.present(safariVC, animated: true, completion: nil)
    }
    
}
