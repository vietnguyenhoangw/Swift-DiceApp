//
//  BaseView.swift
//  DiceApp
//
//  Created by coder on 1/8/21.
//

import UIKit

class QuizzlerView: UIView {
    
    let container: UIView = {
        let container = UIView()
        container.backgroundColor = .red
        return container
    }()
    
    let questionLabel: UILabel = {
        let questionLabel = UILabel()
        questionLabel.text = "Hello world"
        questionLabel.textAlignment = .center
        questionLabel.textColor = .white
        return questionLabel
    }()
    
    let leftBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.setTitle("True", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
         button.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        return button
     }()
    
    let rightBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.setTitle("False", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
         button.backgroundColor = #colorLiteral(red: 0.6, green: 0.1137254902, blue: 0.137254902, alpha: 1)
        return button
     }()
    
    let processText: UILabel = {
        let processText = UILabel()
        processText.text = "1/9"
        processText.textColor = .white
        return processText
    }()
    
    let scoreText: UILabel = {
        let scoreText = UILabel()
        scoreText.text = "Score: 0"
        scoreText.textColor = .white
        return scoreText
    }()
    
    let processBottomBar: UIView = {
        let processBottomBar = UIView()
        processBottomBar.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        return processBottomBar
    }()
    
    var backgroundImage: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "newbackground")
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupLayout()
    }
    
    func setupLayout() {
        self.addSubview(container)
        self.container.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(40)
            make.bottom.equalToSuperview()
        }
        
        self.backgroundImage = UIImageView(image: UIImage(named: "newbackground"))
        self.backgroundImage.contentMode = .scaleToFill
        self.container.insertSubview(self.backgroundImage, at: 0)
        
        self.backgroundImage.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        self.container.addSubview(questionLabel)
        self.questionLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(100)
            make.right.equalToSuperview().offset(-100)
            make.top.equalToSuperview().offset(140)
        }
        
        self.container.addSubview(leftBtn)
        self.leftBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(60)
            make.top.equalTo(self.questionLabel.snp.bottom).offset(100)
            make.height.equalTo(40)
            make.width.equalTo(90)
        }
        
        self.container.addSubview(rightBtn)
        self.rightBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-60)
            make.top.equalTo(self.questionLabel.snp.bottom).offset(100)
            make.height.equalTo(40)
            make.width.equalTo(90)
        }
        
        self.container.addSubview(processText)
        self.processText.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(30)
            make.bottom.equalToSuperview().offset(-60)
        }
        
        self.container.addSubview(scoreText)
        self.scoreText.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-30)
            make.bottom.equalToSuperview().offset(-60)
        }
        
        self.container.addSubview(processBottomBar)
        self.processBottomBar.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(40)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
