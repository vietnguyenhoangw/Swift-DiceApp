//
//  LoginViewController.swift
//  MeowMeowApp
//
//  Created by coder on 1/15/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    var storageUsername: String = "";
    var storagePassword: String = "";
    
    let _view: LoginView = {
        let view = LoginView()
        return view
    }()
    
    override func viewDidLoad() {
        self.setupLayout()
        
        title = "LOGIN"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(onBackPrevious))
        
        self.loginProcess()
    }
    
    func loginProcess() {
        do {
            DispatchQueue.global().async {
                let defaults = UserDefaults.standard
                if let stringOne = defaults.string(forKey: defaultsKeys.userName) {
                    print(stringOne) // Some String Value
                    self.storageUsername = stringOne
                }
                if let stringTwo = defaults.string(forKey: defaultsKeys.password) {
                    print(stringTwo) // Another String Value
                    self.storagePassword = stringTwo
                }
                DispatchQueue.main.async {
                    // update UI always dung main()
                    self.showResultAlert(message: "Get user data success !!!\n" + self.storageUsername)
                }
            }
        } catch {
            print("Have error in read from storage !!!")
        }
        
    }
    
    func showResultAlert(message: String) {
        let alert = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            self.onBackPrevious()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func onBackPrevious() {
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: nil)
        dismiss(animated: false)
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
