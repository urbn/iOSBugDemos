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
    //private var dataSource = ["One", "Two", "Three", "Four", "Five", "Six", "Seven"]
    //private var dataSource = ["78\"", "91\""]
    private var dataSource = ["尺码过小", "尺码偏小", "尺码准确", "尺码偏大", "尺码过大"]
    
    init() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 8.0 // WORKING
        //flowLayout.minimumLineSpacing = 0.0 // BROKEN
        flowLayout.minimumInteritemSpacing = 8.0
        flowLayout.sectionInset = .zero
        flowLayout.scrollDirection = .horizontal
        
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

extension LabelCollectionView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let cell = LabelCollectionViewCell()
        cell.configureCell(with: dataSource[indexPath.row])

        let cellSize = cell.systemLayoutSizeFitting(CGSize(width: UILayoutFittingCompressedSize.width, height: 34.0), withHorizontalFittingPriority: .fittingSizeLevel, verticalFittingPriority: .defaultHigh)
        
        return cellSize
    }
}
