//
//  RootViewController.swift
//  MeowMeowApp
//
//  Created by coder on 1/7/21.
//

import UIKit

class RootViewController: UIViewController {
    
    let _view: RootView = {
        let view = RootView()
        return view
    }()
    
    let imageLogo: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "diceeLogo")
        return imgView
    }()
    
    override func viewDidLoad() {
        self.setupLayout()
        self.declareButtons()
    }
    
    @objc func onPressMenu(sender:UIButton) {
        switch sender.tag {
        case 0:
            let diceVC = DiceViewController()
            navigationViewController(uiVC: diceVC)
            break
        case 1:
            let quizzlerVC = QuizzlerViewController()
            navigationViewController(uiVC: quizzlerVC)
            break
        case 2:
            let getApiVC = GetFromApiViewController()
            navigationViewController(uiVC: getApiVC)
            break
        default:
            print("error")
        }
    }
    
    func declareButtons() {
        self._view.btnDiceGame.tag = 0
        self._view.btnDiceGame.addTarget(self, action: #selector(self.onPressMenu), for: .touchUpInside)
        
        self._view.btnQnA.tag = 1
        self._view.btnQnA.addTarget(self, action: #selector(self.onPressMenu), for: .touchUpInside)
        
        self._view.btnGetApi.tag = 2
        self._view.btnGetApi.addTarget(self, action: #selector(self.onPressMenu), for: .touchUpInside)
    }
    
    func navigationViewController(uiVC: UIViewController) {
        let navController = UINavigationController(rootViewController: uiVC)
        navController.modalPresentationStyle = .fullScreen
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(navController, animated: false)
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
