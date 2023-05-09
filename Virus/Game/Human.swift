//
//  Card.swift
//  Сoncentration
//
//  Created by Valeria Keshishyan on 18.08.2022.
//

import Foundation

class Human {
    
    var isInfected = false
    var isContacted = false
    var infectionFactor = 0
    
    func infected(){
        isInfected = true
    }
    
    func contacted(){
        isContacted = true
    }

    func setInfectionFactor(infectionFactor: Int){
        if (infectionFactor > 0) {
            self.infectionFactor = infectionFactor
        }
    }
}
