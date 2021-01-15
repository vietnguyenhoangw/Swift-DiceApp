//
//  BaseViewController.swift
//  DiceApp
//
//  Created by coder on 1/8/21.
//

import UIKit
import SnapKit

class QuizzlerViewController: UIViewController {
    
    let screenSize: CGRect = UIScreen.main.bounds
    var updateProcess: Double = 0.0
    let allQuestion: QuestionList = QuestionList()
    var currentQuestion: Int = 0
    
    let _view: QuizzlerView = {
        let view = QuizzlerView()
        return view
    }()
    
    override func viewDidLoad() {
        self.setupLayout()
        
        title = "Q AND A GAME"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(onBackPrevious))
        
        self._view.leftBtn.addTarget(self, action: #selector(self.onPressTrue), for: .touchUpInside)
        self._view.rightBtn.addTarget(self, action: #selector(self.onPressFalse), for: .touchUpInside)
        
        let firstQuestion = self.allQuestion.listOfQuestion[currentQuestion]
        self._view.questionLabel.text = firstQuestion.questionContent
    }
    
    @objc func onPressTrue() {
        self.checkAnswer(answer: true)
    }
    
    @objc func onPressFalse() {
        self.checkAnswer(answer: false)
    }
    
    func checkAnswer(answer: Bool) {
        let currentQuestion = self.allQuestion.listOfQuestion[self.currentQuestion]
        if answer == currentQuestion.answer {
            self.showResultAlert(message: "Great, keep continue !", result: true)
        } else {
            self.showResultAlert(message: "Sorry, try again later !", result: false)
        }
    }
    
    func showResultAlert(message: String, result: Bool) {
        let alert = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            if result {
                self.nextQuestion()
            } else {
                self.onBackPrevious()
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func nextQuestion() {
        let processPart = self.screenSize.width / 9
        self.updateProcess = Double(self.updateProcess) + Double(processPart)
        currentQuestion = currentQuestion + 1
        
        if Double(self.updateProcess) != Double(self.screenSize.width) {
            self._view.processBottomBar.snp.updateConstraints { (make) in
                make.width.equalTo(updateProcess)
            }
        } else { self.onBackPrevious() }
        
        let nextQuestion = self.allQuestion.listOfQuestion[currentQuestion]
        self._view.questionLabel.text = nextQuestion.questionContent
        self._view.processText.text = String(self.currentQuestion + 1) + "/9"
        self._view.scoreText.text = "Score: " + String(self.currentQuestion * 100)
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
        updateProcess = Double(self.screenSize.width / 9)
        self._view.processBottomBar.snp.updateConstraints { (make) in
            make.width.equalTo(updateProcess)
        }
        
        self.view.addSubview(self._view)
        self._view.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}
