//
//  SearchListPresenter.swift
//  ABA Music
//
//  Created by Ricardo Casanova on 19/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import Foundation

class SearchListPresenter {
    
    private weak var view: SearchListViewInjection?
    private let interactor: SearchListInteractorDelegate
    private let router: SearchListRouterDelegate
    
    // MARK - Lifecycle
    init(view: SearchListViewInjection, navigationController: UINavigationController? = nil) {
        self.view = view
        self.interactor = SearchListInteractor()
        self.router = SearchListRouter(navigationController: navigationController)
    }
    
}

extension SearchListPresenter: SearchListPresenterDelegate {
    
    func viewDidLoad() {
    }
    
    func searchArtist(_ artist: String?) {
    }
    
    func artistSelectedAt(_ index: Int) {
    }
    
}
