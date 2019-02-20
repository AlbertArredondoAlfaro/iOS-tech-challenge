//
//  SearchListDatasource.swift
//  ABA Music
//
//  Created by Ricardo Casanova on 20/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import UIKit

class SearchListDatasource: NSObject {
    
    public var items: [ArtistViewModel] {
        didSet {
            //__ This is a little trick.
            //__ I created a dicctionary with keys = $0.dt
            //__ and then I created a sorted keys array.
            //__ This is to build the sections and add a headerview
            //__ with the day string.
            //__ Why am I doing this here?
            //__ easy -> to do this logic once :)
            dictionary = Dictionary(grouping: items, by: { $0.artistName })
            keysArray = Array(dictionary.keys).sorted(by: { $0 < $1 })
        }
    }
    
    private var dictionary: Dictionary<String, [ArtistViewModel]>
    private var keysArray: [String]
    
    public override init() {
        self.items = []
        dictionary = [:]
        keysArray = []
        super.init()
    }
}

extension SearchListDatasource: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let dictionary = Dictionary(grouping: items, by: { $0.artistName })
        return dictionary.keys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let elementsPerSection = dictionary[keysArray[section]] else {
            return 0
        }
        return elementsPerSection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrackCollectionViewCell.identifier, for: indexPath) as? TrackCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if let elementsPerSection = dictionary[keysArray[indexPath.section]]  {
            let viewModel = elementsPerSection[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TrackHeaderView()
        if let elementsPerSection = dictionary[keysArray[section]]  {
            let viewModel = elementsPerSection[0]
            headerView.title = viewModel.artistName
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return TrackHeaderView.height
    }
    
}
