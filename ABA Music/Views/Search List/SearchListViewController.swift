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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureNavigationBar()
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
    }
    
}

extension SearchListViewController: SearchListViewInjection {
}

