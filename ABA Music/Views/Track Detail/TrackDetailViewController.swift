//
//  TrackDetailViewController.swift
//  ABA Music
//
//  Created by Ricardo Casanova on 20/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import Foundation

class TrackDetailViewController: BaseViewController {
    
    public var presenter: TrackDetailPresenterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureNavigationBar()
    }
    
}

// MARK: - Setup views
extension TrackDetailViewController {
    
    /**
     * SetupViews
     */
    private func setupViews() {
        view.backgroundColor = .black()
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
    
}

// MARK: - Layout & constraints
extension TrackDetailViewController {
    
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

extension TrackDetailViewController: TrackDetailViewInjection {
    
}
