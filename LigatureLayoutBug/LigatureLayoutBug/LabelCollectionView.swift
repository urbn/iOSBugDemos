//
//  LabelCollectionView.swift
//  LigatureLayoutBug
//
//  Created by Nicole Souvenir on 10/25/18.
//  Copyright © 2018 Nicole Souvenir. All rights reserved.
//

import UIKit

class LabelCollectionView: UIView {

    private let collectionView: UICollectionView
    private var dataSource = ["Red", "Orange", "Yellow", "Green", "1", "2", "3", "4"]
    
    init() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 5.0
        flowLayout.itemSize = CGSize(width: 100, height: 100)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        super.init(frame: .zero)
        
        collectionView.dataSource = self
        collectionView.register(LabelCollectionViewCell.self, forCellWithReuseIdentifier: "ButtonCell")
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .blue
        collectionView.heightAnchor.constraint(equalToConstant: flowLayout.itemSize.height).isActive = true
        addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implement ed")
    }
}

//MARK: DataSource
extension LabelCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCell", for: indexPath) as? LabelCollectionViewCell else { return UICollectionViewCell()}
        
        let label = dataSource[indexPath.row]
        
        cell.configureCell(with: label)
        
        return cell
    }
}
