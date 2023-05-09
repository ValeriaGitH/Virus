//
//  ViewController.swift
//  Сoncentration
//
//  Created by Valeria Keshishyan on 15.08.2022.
//

import UIKit

class StartViewController: UIViewController {
    
    var startView = StartView()
    
    override func loadView() {
        super.loadView()
        
        startView.load()
        startView.startButton.addTarget(self, action: #selector(selectorButtonStart(param: )), for: .touchDown)
        
        view = startView
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func selectorButtonStart(param: UIButton){
        
        guard let groupSizeString = startView.groupSizeTextFiled.text else {return}
        guard let infectionFactorString = startView.infectionFactorTextFiled.text else {return}
        guard let tSecString = startView.tSecTextFiled.text else {return}
        
        guard let groupSize = Int(groupSizeString) else {return}
        guard let infectionFactor = Int(infectionFactorString) else {return}
        guard let tSec = Int(tSecString) else {return}
        
        if (groupSize < 0) {return}        
        //

        let game = GameViewController()
        game.start(groupSize: groupSize, infectionFactor: infectionFactor, tSec: tSec)
        self.present(game, animated: true)
        
        UserDefaults.standard.set(groupSizeString, forKey: "groupSize")
        UserDefaults.standard.set(infectionFactorString, forKey: "infectionFactor")
        UserDefaults.standard.set(tSecString, forKey: "tSec")
    }
}
