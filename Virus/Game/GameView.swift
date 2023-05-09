//
//  GameView.swift
//  Virus
//
//  Created by Valeria Keshishyan on 09.05.2023.
//

import Foundation
import UIKit

class GameView: UIView{
    
    var infectedLabel = UILabel()
    var collectionView: UICollectionView!
    
    var widthSegment = 0.0
    
    func load(widthSegment: Double){
        self.widthSegment = widthSegment
        self.backgroundColor = .white
        setupView()
    }
    
    func setupView(){
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        //collectionView.backgroundColor = .blue
        
        infectedLabel.textAlignment = .center
        infectedLabel.font = UIFont(name: "Helvetica", size: 28)
        infectedLabel.textColor = .blue
        
        self.addSubview(infectedLabel)
        self.addSubview(collectionView)
        
        infectedLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infectedLabel.heightAnchor.constraint(equalToConstant: 40),
            infectedLabel.widthAnchor.constraint(equalToConstant: 200),
            infectedLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            infectedLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let sectionInset = widthSegment
        let itemSize = widthSegment*2
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: sectionInset, left: sectionInset, bottom: CGFloat(sectionInset), right: sectionInset)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.scrollDirection = .vertical
        return layout
    }
    
    func setInfected(value: Int, maxValue: Int){
        infectedLabel.text = "\(value)/\(maxValue)"
    }
    
}
