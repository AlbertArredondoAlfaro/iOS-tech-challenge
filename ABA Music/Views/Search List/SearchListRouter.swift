//
//  SearchListRouter.swift
//  ABA Music
//
//  Created by Ricardo Casanova on 19/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import Foundation

class SearchListRouter {
    
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    
    public static func setupModule() -> UINavigationController {
        let searchListVC = SearchListViewController()
        let searchListNVC = UINavigationController(rootViewController: searchListVC)
        searchListVC.presenter = SearchListPresenter(view: searchListVC, navigationController: searchListNVC)
        return searchListNVC
    }
    
}

// MARK: - SearchListRouterDelegate
extension SearchListRouter: SearchListRouterDelegate {
    
    func showTrackDetail(_ track: TrackViewModel) {
        let trackDetailVC = TrackDetailRouter.setupModuleWithTrack(track, navigationController:  navigationController)
        navigationController?.pushViewController(trackDetailVC, animated: true)
    }
    
}
