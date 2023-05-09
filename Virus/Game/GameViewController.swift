//
//  GameViewController.swift
//  Virus
//
//  Created by Valeria Keshishyan on 08.05.2023.
//

import Foundation
import UIKit

class GameViewController: UIViewController{
    
    private(set) var people = [Human]()
    var gameView = GameView()
    
    var timer = Timer()
    
    let nRow = 6
    
    var groupSize = 0
    var infectedSize = 0
    
    func start(groupSize: Int, infectionFactor: Int, tSec: Int){
        
        self.groupSize = groupSize
        
        for _ in 0..<groupSize {
            let human = Human()
            human.setInfectionFactor(infectionFactor: infectionFactor)
            people.append(human)
        }
        
        gameView.load(widthSegment: self.view.frame.width / CGFloat(nRow*3))
        gameView.setInfected(value: infectedSize, maxValue: groupSize)
        
        gameView.collectionView.dataSource = self
        gameView.collectionView.delegate = self
        
        gameView.collectionView.register(GameViewCell.self, forCellWithReuseIdentifier: GameViewCell.id)
        
        view = gameView
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        if (tSec<1) {return}
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(tSec), repeats: true) { timer in
            self.timerFunction()
        }

        timer.fire()
    }
    
    func timerFunction() {
        
        for iHuman in 0..<groupSize{
            if people[iHuman].isInfected{
                if people[iHuman].infectionFactor > 0 {
                    var iNearby:Int
                    if(iHuman%nRow != 0  && iHuman>=nRow) {
                        iNearby = iHuman-nRow-1
                        if (contact() && people[iHuman].infectionFactor > 0){
                            people[iNearby].contacted()
                            people[iHuman].infectionFactor-=1
                        }
                    }
                    if(iHuman>=nRow) {
                        iNearby = iHuman-nRow
                        if (contact() && people[iHuman].infectionFactor > 0){
                            people[iNearby].contacted()
                            people[iHuman].infectionFactor-=1
                        }
                    }
                    if(iHuman%nRow != nRow-1 && iHuman>=nRow){
                        iNearby = iHuman-nRow+1
                        if (contact() && people[iHuman].infectionFactor > 0){
                            people[iNearby].contacted()
                            people[iHuman].infectionFactor-=1
                        }
                    }
                    if(iHuman%nRow != 0){
                        iNearby = iHuman-1
                        if (contact() && people[iHuman].infectionFactor > 0){
                            people[iNearby].contacted()
                            people[iHuman].infectionFactor-=1
                        }
                    }
                    if(iHuman%nRow != nRow-1 && iHuman+1 < groupSize) {
                        iNearby = iHuman+1
                        if (contact() && people[iHuman].infectionFactor > 0){
                            people[iNearby].contacted()
                            people[iHuman].infectionFactor-=1
                        }
                    }
                    if(iHuman%nRow != 0 && iHuman+nRow-1 < groupSize){
                        iNearby = iHuman+nRow-1
                        if (contact() && people[iHuman].infectionFactor > 0){
                            people[iNearby].contacted()
                            people[iHuman].infectionFactor-=1
                        }
                    }
                    if(iHuman+nRow<groupSize){
                        iNearby = iHuman+nRow
                        if (contact() && people[iHuman].infectionFactor > 0){
                            people[iNearby].contacted()
                            people[iHuman].infectionFactor-=1
                        }
                    }
                    if(iHuman%nRow != nRow-1 && iHuman+nRow+1 < groupSize){
                        iNearby = iHuman+nRow+1
                        if (contact() && people[iHuman].infectionFactor > 0){
                            people[iNearby].contacted()
                            people[iHuman].infectionFactor-=1
                        }
                    }
                }
            }
        }
        
        for human in people {
            if (!human.isInfected){
                if (human.isContacted){
                    human.infected()
                    infectedSize+=1
                    gameView.setInfected(value: infectedSize, maxValue: groupSize)
                }
            }
        }
        if (gameView.collectionView != nil) {gameView.collectionView.reloadData()}
        if (infectedSize == groupSize) {timer.invalidate()}
    }
    
    func contact()->Bool{
        if (arc4random_uniform(100)>50){
            return true
        }
        return false
    }
}

extension GameViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        people.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameViewCell.id, for: indexPath) as?
                GameViewCell else {
            return UICollectionViewCell()
        }
        if (people[indexPath.item].isInfected){
            cell.infected()
        }else {
            cell.uninfected()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if (!people[indexPath.item].isInfected){
            people[indexPath.item].infected()
            infectedSize+=1
            gameView.setInfected(value: infectedSize, maxValue: groupSize)
        }
        collectionView.reloadData()
    }
}
    
