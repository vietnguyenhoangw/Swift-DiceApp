//
//  RootViewController.swift
//  MeowMeowApp
//
//  Created by coder on 1/7/21.
//

import UIKit

class RootViewController: UIViewController {
    
    var timer = Timer()
    var backgroundTask: UIBackgroundTaskIdentifier = UIBackgroundTaskIdentifier.invalid
    
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
        self.saveUserInfoToStorage()
        
        
        DispatchQueue.main.async {
            self.registerBackgroundTask()
            self.scheduledTimerWithTimeInterval()
        }
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
    
    func saveUserInfoToStorage() {
        DispatchQueue.global().async {
            let defaults = UserDefaults.standard
            defaults.set("vietnguyenhoangw@gmail.com", forKey: defaultsKeys.userName)
            defaults.set("hoangviet", forKey: defaultsKeys.password)
        }
    }
    
    func declareButtons() {
        self._view.btnDiceGame.tag = 0
        self._view.btnDiceGame.addTarget(self, action: #selector(self.onPressMenu), for: .touchUpInside)
        
        self._view.btnQnA.tag = 1
        self._view.btnQnA.addTarget(self, action: #selector(self.onPressMenu), for: .touchUpInside)
        
        self._view.btnGetApi.tag = 2
        self._view.btnGetApi.addTarget(self, action: #selector(self.onPressMenu), for: .touchUpInside)
        
        let pressGesture = UITapGestureRecognizer(target: self, action: #selector(self.pressGetstureDetected(_:)))
        pressGesture.numberOfTapsRequired = 1
        self._view.loginLabel.isUserInteractionEnabled = true
        self._view.loginLabel.addGestureRecognizer(pressGesture)
    }
    
    @objc func pressGetstureDetected(_ sender: UITapGestureRecognizer) {
        let loginVC = LoginViewController()
        navigationViewController(uiVC: loginVC)
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
    
    func showResultAlert(message: String) {
        let alert = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        }))
        self.present(alert, animated: true, completion: nil)
    }

    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
    }

    @objc func updateCounting(){
        NSLog("counting..")
    }
    
    func registerBackgroundTask() {
      backgroundTask = UIApplication.shared.beginBackgroundTask { [weak self] in
        self?.endBackgroundTask()
      }
        assert(backgroundTask != UIBackgroundTaskIdentifier.invalid)
    }
     
    func endBackgroundTask() {
      print("Background task ended.")
      UIApplication.shared.endBackgroundTask(backgroundTask)
        backgroundTask = UIBackgroundTaskIdentifier.invalid
    }
}
