//
//  StartView.swift
//  Virus
//
//  Created by Valeria Keshishyan on 08.05.2023.
//

import Foundation
import UIKit


class StartView: UIView{
    
    let groupSizeLabel = UILabel()
    let groupSizeTextFiled = UITextField()
    let infectionFactorLabel = UILabel()
    let infectionFactorTextFiled = UITextField()
    let tSecLabel = UILabel()
    let tSecTextFiled = UITextField()
    let startButton = UIButton()
    
    func load(){
        self.backgroundColor = .white
        
        CreateGroupSize()
        CreateInfectionFactor()
        CreateTSec()
        CreateButtonStart()
        
        ActivateConstraint()
    }
    
    func ActivateConstraint(){
        groupSizeLabel.translatesAutoresizingMaskIntoConstraints = false
        groupSizeTextFiled.translatesAutoresizingMaskIntoConstraints = false
        infectionFactorLabel.translatesAutoresizingMaskIntoConstraints = false
        infectionFactorTextFiled.translatesAutoresizingMaskIntoConstraints = false
        tSecLabel.translatesAutoresizingMaskIntoConstraints = false
        tSecTextFiled.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        let heightConstant:CGFloat = 40
        let widthConstant:CGFloat = 60
        let widthConstantTextFiled:CGFloat = 140
        let indentConstant:CGFloat = 20
        
        NSLayoutConstraint.activate([
            groupSizeLabel.heightAnchor.constraint(equalToConstant: heightConstant),
            groupSizeLabel.widthAnchor.constraint(equalToConstant: widthConstant),
            groupSizeLabel.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: -110),
            groupSizeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            
            groupSizeTextFiled.heightAnchor.constraint(equalToConstant: heightConstant),
            groupSizeTextFiled.widthAnchor.constraint(equalToConstant: widthConstantTextFiled),
            groupSizeTextFiled.leadingAnchor.constraint(equalTo: groupSizeLabel.trailingAnchor, constant: indentConstant),
            groupSizeTextFiled.topAnchor.constraint(equalTo: groupSizeLabel.topAnchor),
            
            infectionFactorLabel.heightAnchor.constraint(equalToConstant: heightConstant),
            infectionFactorLabel.widthAnchor.constraint(equalToConstant: widthConstant),
            infectionFactorLabel.leadingAnchor.constraint(equalTo: groupSizeLabel.leadingAnchor),
            infectionFactorLabel.topAnchor.constraint(equalTo: groupSizeLabel.bottomAnchor, constant: indentConstant),
            
            infectionFactorTextFiled.heightAnchor.constraint(equalToConstant: heightConstant),
            infectionFactorTextFiled.widthAnchor.constraint(equalToConstant: widthConstantTextFiled),
            infectionFactorTextFiled.leadingAnchor.constraint(equalTo: infectionFactorLabel.trailingAnchor, constant: indentConstant),
            infectionFactorTextFiled.topAnchor.constraint(equalTo: infectionFactorLabel.topAnchor),
            
            tSecLabel.heightAnchor.constraint(equalToConstant: heightConstant),
            tSecLabel.widthAnchor.constraint(equalToConstant: widthConstant),
            tSecLabel.leadingAnchor.constraint(equalTo: groupSizeLabel.leadingAnchor),
            tSecLabel.topAnchor.constraint(equalTo: infectionFactorLabel.bottomAnchor, constant: indentConstant),
                       
            tSecTextFiled.heightAnchor.constraint(equalToConstant: heightConstant),
            tSecTextFiled.widthAnchor.constraint(equalToConstant: widthConstantTextFiled),
            tSecTextFiled.leadingAnchor.constraint(equalTo: tSecLabel.trailingAnchor, constant: indentConstant),
            tSecTextFiled.topAnchor.constraint(equalTo: tSecLabel.topAnchor),
           
            startButton.heightAnchor.constraint(equalToConstant: 45),
            startButton.widthAnchor.constraint(equalToConstant: 220),
            startButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            startButton.topAnchor.constraint(equalTo: tSecLabel.bottomAnchor, constant: 40)
 
        ])
        
    }
    
    func CreateGroupSize(){
        groupSizeLabel.text = "People: "
        
        groupSizeTextFiled.keyboardType = .numberPad
        groupSizeTextFiled.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        groupSizeTextFiled.layer.borderWidth = 2
        groupSizeTextFiled.textAlignment = .center
        groupSizeTextFiled.text = UserDefaults.standard.string(forKey: "groupSize")
                
        self.addSubview(groupSizeLabel)
        self.addSubview(groupSizeTextFiled)
    }
    
    
    func CreateInfectionFactor(){
        infectionFactorLabel.text = "Factor: "
        
        infectionFactorTextFiled.keyboardType = .numberPad
        infectionFactorTextFiled.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        infectionFactorTextFiled.layer.borderWidth = 2
        infectionFactorTextFiled.textAlignment = .center
        infectionFactorTextFiled.text = UserDefaults.standard.string(forKey: "infectionFactor")

        self.addSubview(infectionFactorLabel)
        self.addSubview(infectionFactorTextFiled)
    }
    
    
    func CreateTSec(){
        tSecLabel.text = "T, sec: "
        
        tSecTextFiled.keyboardType = .numberPad
        tSecTextFiled.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        tSecTextFiled.layer.borderWidth = 2
        tSecTextFiled.textAlignment = .center
        tSecTextFiled.text = UserDefaults.standard.string(forKey: "tSec")

        self.addSubview(tSecLabel)
        self.addSubview(tSecTextFiled)
    }
    
    
    func CreateButtonStart(){
        
        startButton.setTitle("Start", for: .normal)

        startButton.backgroundColor = UIColor.blue
        startButton.layer.cornerRadius = 12
        
        self.addSubview(startButton)
    }
}
