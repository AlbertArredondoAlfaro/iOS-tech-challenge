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
    
    private let customTitleView: CustomTitleView = CustomTitleView()
    private let searchView: SearchView = SearchView()
    private let searchListContainerView: UIView = UIView()
    private var searchListCollectionView: UICollectionView?
    
    private var datasource: SearchListDatasource?
    private var numberOfCellsInARow: Int = 2
    
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
        view.backgroundColor = .black()
        edgesForExtendedLayout = []
        
        configureSubviews()
        addSubviews()
    }
    
    /**
     * ConfigureSubviews
     */
    private func configureSubviews() {
        searchView.delegate = self
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        searchListCollectionView = UICollectionView(frame: searchListContainerView.bounds, collectionViewLayout: flowLayout)
        searchListCollectionView?.backgroundColor = .clear
        searchListCollectionView?.isUserInteractionEnabled = true
        searchListCollectionView?.showsVerticalScrollIndicator = false
        searchListCollectionView?.delegate = self
        registerCells()
        setupDatasource()
    }
    
    private func configureNavigationBar() {
        customTitleView.titleColor = .white()
        customTitleView.setTitle("ABA Music")
        customTitleView.subtitleColor = .white()
        customTitleView.setSubtitle("ABA English©")
        navigationItem.titleView = customTitleView
    }
    
    private func registerCells() {
        searchListCollectionView?.register(TrackCollectionViewCell.self, forCellWithReuseIdentifier: TrackCollectionViewCell.identifier)
        searchListCollectionView?.register(TrackHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: TrackHeaderView.identifier)
    }
    
    private func setupDatasource() {
        if let searchListCollectionView = searchListCollectionView {
            datasource = SearchListDatasource()
            searchListCollectionView.dataSource = datasource
        }
    }
    
    private func getPostCellSide() -> CGFloat {
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let cellContainerWidth: CGFloat = screenWidth - Layout.CollectionViewCell.centerSpacing*(CGFloat(numberOfCellsInARow-1)) - Layout.CollectionViewCell.edgeSpacingLeft*CGFloat(numberOfCellsInARow)
        return cellContainerWidth / CGFloat(numberOfCellsInARow)
    }
    
}

// MARK: - Layout & constraints
extension SearchListViewController {
    
    /**
     * Internal struct for layout
     */
    private struct Layout {
        
        struct CollectionViewCell {
            static let centerSpacing: CGFloat = 16.0
            static let edgeSpacingTop: CGFloat = 24.0
            static let edgeSpacingLeft: CGFloat = 16.0
            static let edgeSpacingBottom: CGFloat = 24.0
            static let edgeSpacingRight: CGFloat = 16.0
        }
        
    }
    
    /**
     * Add subviews
     */
    private func addSubviews() {
        view.addSubview(searchView)
        view.addSubview(searchListContainerView)
        
        view.addConstraintsWithFormat("H:|[v0]|", views: searchView)
        view.addConstraintsWithFormat("V:|[v0(\(searchView.height))]", views: searchView)
        
        view.addConstraintsWithFormat("H:|[v0]|", views: searchListContainerView)
        view.addConstraintsWithFormat("V:[v0]-10.0-[v1]|", views: searchView, searchListContainerView)
        
        if let searchListCollectionView = searchListCollectionView {
            searchListContainerView.addSubview(searchListCollectionView)
            searchListContainerView.addConstraintsWithFormat("H:|[v0]|", views: searchListCollectionView)
            searchListContainerView.addConstraintsWithFormat("V:|[v0]|", views: searchListCollectionView)
        }
    }
    
}

// MARK:- UICollectionViewDelegate (with UICollectionViewDelegateFlowLayout)
extension SearchListViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = getPostCellSide()
        
        return CGSize(width: side, height: TrackCollectionViewCell.getHeight(for: side))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Layout.CollectionViewCell.edgeSpacingTop, left: Layout.CollectionViewCell.edgeSpacingLeft, bottom: Layout.CollectionViewCell.edgeSpacingBottom, right: Layout.CollectionViewCell.edgeSpacingRight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Layout.CollectionViewCell.centerSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Layout.CollectionViewCell.centerSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: TrackHeaderView.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("TO DO")
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
        if fromBeginning {
            searchListCollectionView?.setContentOffset(CGPoint.zero, animated: false)
        }
        
        datasource?.items = viewModels
        searchListCollectionView?.reloadData()
    }
    
}

