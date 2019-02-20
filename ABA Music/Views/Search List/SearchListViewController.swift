//
//  SearchListViewController.swift
//  ABA Music
//
//  Created by Ricardo Casanova on 19/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import Foundation

class SearchListViewController: BaseViewController {
    
    public var presenter: SearchListPresenterDelegate?
    
    private let searchView: SearchView = SearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureNavigationBar()
        presenter?.viewDidLoad()
    }
    
}

// MARK: - Setup views
extension SearchListViewController {
    
    /**
     * SetupViews
     */
    private func setupViews() {
        view.backgroundColor = .white()
        edgesForExtendedLayout = []
        
        configureSubviews()
        addSubviews()
    }
    
    /**
     * ConfigureSubviews
     */
    private func configureSubviews() {
        searchView.delegate = self
    }
    
    private func configureNavigationBar() {
    }
    
    private func registerCells() {
    }
    
    private func setupDatasource() {
    }
    
}

// MARK: - Layout & constraints
extension SearchListViewController {
    
    /**
     * Internal struct for layout
     */
    private struct Layout {
        
    }
    
    /**
     * Add subviews
     */
    private func addSubviews() {
        view.addSubview(searchView)
        
        view.addConstraintsWithFormat("H:|[v0]|", views: searchView)
        view.addConstraintsWithFormat("V:|[v0(\(searchView.height))]", views: searchView)
    }
    
}

extension SearchListViewController: SearchViewDelegate {
    
    func searchButtonPressedWithSearch(_ search: String?) {
        presenter?.searchArtist(search)
    }
    
}

extension SearchListViewController: SearchListViewInjection {
    
    func showProgress(_ show: Bool, status: String) {
        showLoader(show, status: status)
    }
    
    func showProgress(_ show: Bool) {
        showLoader(show)
    }
    
    func showMessageWith(title: String, message: String, actionTitle: String) {
        showAlertWith(title: title, message: message, actionTitle: actionTitle)
    }
    
    func loadArtists(_ viewModels: [ArtistViewModel], fromBeginning: Bool) {
        print("TO DO")
    }
    
}

