//
//  BaseView.swift
//  DiceApp
//
//  Created by coder on 1/7/21.
//

import UIKit

class RootView: UIView {
    
    let container: UIView = {
        let container = UIView()
        container.backgroundColor = .red
        return container
    }()
    
    var loginLabel: UILabel = {
        let txtLabel = UILabel()
        txtLabel.text = "Login"
        txtLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return txtLabel
    }()
    
    var backgroundImage: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "newbackground")
        return imgView
    }()
    
    var btnDiceGame: UIButton = {
       let button = UIButton()
       button.layer.cornerRadius = 15
       button.setTitle("DICE GAME", for: .normal)
       button.setTitleColor(.white, for: .normal)
       button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.backgroundColor = #colorLiteral(red: 0.6, green: 0.1137254902, blue: 0.137254902, alpha: 1)
       return button
    }()
    
    var btnQnA: UIButton = {
       let button = UIButton()
       button.layer.cornerRadius = 15
       button.setTitle("ANSWER AND QUESTION GAME", for: .normal)
       button.setTitleColor(.white, for: .normal)
       button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.backgroundColor = #colorLiteral(red: 0.6, green: 0.1137254902, blue: 0.137254902, alpha: 1)
       return button
    }()
    
    var btnGetApi: UIButton = {
       let button = UIButton()
       button.layer.cornerRadius = 15
       button.setTitle("GET SOMETHING FROM INTERNET", for: .normal)
       button.setTitleColor(.white, for: .normal)
       button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.backgroundColor = #colorLiteral(red: 0.6, green: 0.1137254902, blue: 0.137254902, alpha: 1)
       return button
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
            make.top.equalToSuperview()
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
        
        let jeremyGif = UIImage.gifImageWithName("giphy.gif")
        let imageView = UIImageView(image: jeremyGif)
        self.container.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.top.equalToSuperview().offset(60)
        }
        
        self.container.addSubview(btnDiceGame)
        self.btnDiceGame.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(40)
            make.height.equalTo(50)
            make.width.equalToSuperview().offset(-80)
            make.centerX.equalToSuperview()
        }
        
        self.container.addSubview(btnQnA)
        self.btnQnA.snp.makeConstraints { (make) in
            make.top.equalTo(self.btnDiceGame.snp.bottom).offset(30)
            make.height.equalTo(50)
            make.width.equalToSuperview().offset(-80)
            make.centerX.equalToSuperview()
        }
        
        self.container.addSubview(btnGetApi)
        self.btnGetApi.snp.makeConstraints { (make) in
            make.top.equalTo(self.btnQnA.snp.bottom).offset(30)
            make.height.equalTo(50)
            make.width.equalToSuperview().offset(-80)
            make.centerX.equalToSuperview()
        }
        
        self.container.addSubview(loginLabel)
        self.loginLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
