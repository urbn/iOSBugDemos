//
//  ViewController.swift
//  LigatureLayoutBug
//
//  Created by Nicole Souvenir on 10/25/18.
//  Copyright © 2018 Nicole Souvenir. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private var englighDataSource = ["One", "Two", "Three", "Four", "Five", "Six", "Seven"]
    private var inchesDataSource = ["78\"", "91\""]
    private var chineseDataSource = ["尺码过小", "尺码偏小", "尺码准确", "尺码偏大", "尺码过大"]
    
    private let brokenMinimumLineSpacing: CGFloat = 0.0
    private let workingMinimumLineSpacing: CGFloat = 8.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Button Flow Layout Bug"
        view.backgroundColor = .white
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20.0
        stackView.distribution = .fill
        
        //collection view
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        //stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let workingDescription = descriptionLabel(withText: "This is working... WRITE MORE STUFF HERE...")
        let workingCollectionView = layoutView(withDataSource: englighDataSource, minimumLineSpacing: brokenMinimumLineSpacing)
        stackView.addArrangedSubview(workingDescription)
        stackView.addArrangedSubview(workingCollectionView)
        
        let brokenDescription = descriptionLabel(withText: "This is broken... WRITE MORE STUFF HERE...")
        let brokenInchesCollectionView = layoutView(withDataSource: inchesDataSource, minimumLineSpacing: brokenMinimumLineSpacing)
        let brokenChineseCollectionView = layoutView(withDataSource: chineseDataSource, minimumLineSpacing: brokenMinimumLineSpacing)
        stackView.addArrangedSubview(brokenDescription)
        stackView.addArrangedSubview(brokenInchesCollectionView)
        stackView.addArrangedSubview(brokenChineseCollectionView)

        let fixedDescription = descriptionLabel(withText: "This is fixed... WRITE MORE STUFF HERE...")
        let fixedInchesCollectionView = layoutView(withDataSource: inchesDataSource, minimumLineSpacing: workingMinimumLineSpacing)
        let fixedChineseCollectionView = layoutView(withDataSource: chineseDataSource, minimumLineSpacing: workingMinimumLineSpacing)
        stackView.addArrangedSubview(fixedDescription)
        stackView.addArrangedSubview(fixedInchesCollectionView)
        stackView.addArrangedSubview(fixedChineseCollectionView)
    }
    
    // MARK: Layout Convenience
    private func descriptionLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .black
        
        return label
    }
    
    private func layoutView(withDataSource dataSource: [String], minimumLineSpacing: CGFloat) -> LayoutView {
        let layoutView = LayoutView(with: dataSource, minimumLineSpacing: minimumLineSpacing)
        layoutView.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        return layoutView
    }
}

