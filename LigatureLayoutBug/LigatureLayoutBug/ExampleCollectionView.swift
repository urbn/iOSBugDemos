//
//  ExamplesView.swift
//  LigatureLayoutBug
//
//  Created by Nicole Souvenir on 10/31/18.
//  Copyright © 2018 Nicole Souvenir. All rights reserved.
//

import UIKit

class ExampleCollectionView: UICollectionView {
    
    let dataObject: [String]
    
    init(withDataObject dataObject: [String], minimumLineSpacing: CGFloat) {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = minimumLineSpacing //between items in the same grid
        flowLayout.minimumInteritemSpacing = 8.0 //between items in the same row
        flowLayout.sectionInset = .zero
        flowLayout.scrollDirection = .horizontal
        
        self.dataObject = dataObject
        super.init(frame: .zero, collectionViewLayout: flowLayout) //must have designated initializer
        
        dataSource = self
        delegate = self
        register(LabelCollectionViewCell.self, forCellWithReuseIdentifier: "ButtonCell")
        backgroundColor = .blue
        showsHorizontalScrollIndicator = false

        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: flowLayout.itemSize.height).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: DataSource Methods
extension ExampleCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataObject.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCell", for: indexPath) as? LabelCollectionViewCell else { return UICollectionViewCell()}
        
        let label = dataObject[indexPath.row]
        cell.configureCell(with: label)
        
        return cell
    }
}

//MARK: FlowLayout Delegate
extension ExampleCollectionView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let cell = LabelCollectionViewCell()
        
        cell.configureCell(with: dataObject[indexPath.row])

        let cellSize = cell.systemLayoutSizeFitting(CGSize(width: UILayoutFittingCompressedSize.width, height: 44.0), withHorizontalFittingPriority: .fittingSizeLevel, verticalFittingPriority: .defaultHigh)

        return cellSize
    }
}
