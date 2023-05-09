//
//  GameViewCell.swift
//  Virus
//
//  Created by Valeria Keshishyan on 08.05.2023.
//

import Foundation
import UIKit

class GameViewCell: UICollectionViewCell {
    static let id = "Cell"
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        imageView.image = UIImage(named: "uninfected")
        self.contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        self.clipsToBounds = true //Обрезать фото, чтобы не заходило за пределы
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func uninfected(){
        imageView.image = UIImage(named: "uninfected") }
    
    func infected(){
        imageView.image = UIImage(named: "infected")
    }
}
