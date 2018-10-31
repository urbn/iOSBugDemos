//
//  LayoutView.swift
//  LigatureLayoutBug
//
//  Created by Nicole Souvenir on 10/25/18.
//  Copyright © 2018 Nicole Souvenir. All rights reserved.
//

import UIKit

class LayoutView: UIView {
    
    private let collectionView: UICollectionView
    private let dataSource: [String]
    
    init(with dataSource: [String], minimumLineSpacing: CGFloat) {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = minimumLineSpacing //between items in the same grid
        flowLayout.minimumInteritemSpacing = 8.0 //between items in the same row
        flowLayout.sectionInset = .zero
        flowLayout.scrollDirection = .horizontal
        
        self.dataSource = dataSource
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        super.init(frame: .zero)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(LabelCollectionViewCell.self, forCellWithReuseIdentifier: "ButtonCell")
        collectionView.backgroundColor = .blue
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.heightAnchor.constraint(equalToConstant: flowLayout.itemSize.height).isActive = true
        addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implement ed")
    }
}

//MARK: DataSource Methods
extension LayoutView: UICollectionViewDataSource {
    
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

//MARK: FlowLayout
extension LayoutView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cell = LabelCollectionViewCell()
        
        cell.configureCell(with: dataSource[indexPath.row])
        
        let cellSize = cell.systemLayoutSizeFitting(CGSize(width: UILayoutFittingCompressedSize.width, height: 44.0), withHorizontalFittingPriority: .fittingSizeLevel, verticalFittingPriority: .defaultHigh)
        
        return cellSize
    }
}
