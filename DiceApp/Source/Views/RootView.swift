//
//  BaseView.swift
//  DiceApp
//
//  Created by coder on 1/6/21.
//

import UIKit

class RootView: UIView {
    
    let container: UIView = {
        let container = UIView()
        container.backgroundColor = .red
        return container
    }()
    
    let imageLogo: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "diceeLogo")
        return imgView
    }()
    
    let leftDice: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "dice1")
        return imgView
    }()
    
    let rightDice: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "dice1")
        return imgView
    }()
    
    var backgroundImage: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "newbackground")
        return imgView
    }()
    
    let btnRoll: UIButton = {
       let button = UIButton()
       button.layer.cornerRadius = 15
       button.setTitle("Roll the dice", for: .normal)
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
        
        self.container.addSubview(imageLogo)
        self.imageLogo.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(100)
            make.right.equalToSuperview().offset(-100)
            make.top.equalToSuperview().offset(60)
        }
        
        self.container.addSubview(leftDice)
        self.leftDice.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(60)
            make.top.equalTo(self.imageLogo.snp.bottom).offset(150)
            make.height.equalTo(90)
            make.width.equalTo(90)
        }
        
        self.container.addSubview(rightDice)
        self.rightDice.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-60)
            make.top.equalTo(self.imageLogo.snp.bottom).offset(150)
            make.height.equalTo(90)
            make.width.equalTo(90)
        }
        
        self.container.addSubview(btnRoll)
        self.btnRoll.snp.makeConstraints { (make) in
            make.top.equalTo(self.leftDice.snp.bottom).offset(80)
            make.height.equalTo(60)
            make.width.equalTo(120)
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
