//
//  BaseViewController.swift
//  DiceApp
//
//  Created by coder on 1/6/21.
//

import UIKit
import SnapKit

class RootViewController: UIViewController {
    
    let diceeArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6",]
    
    let _view: RootView = {
        let view = RootView()
        return view
    }()
    
    override func viewDidLoad() {
        self.setupLayout()
        self._view.btnRoll.addTarget(self, action: #selector(self.onRollPress), for: .touchUpInside)
    }
    
    @objc func onRollPress() {
        self.updateDice()
    }
    
    func updateDice() {
        let leftDiceValue = Int.random(in: 0..<6)
        let rightDiceValue = Int.random(in: 0..<6)
        self._view.leftDice.image = UIImage(named: diceeArray[leftDiceValue])
        self._view.rightDice.image = UIImage(named: diceeArray[rightDiceValue])
    }
    
    func setupLayout() {
        self.view.addSubview(self._view)
        self._view.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}
