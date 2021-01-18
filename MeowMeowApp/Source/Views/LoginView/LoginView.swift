//
//  LoginView.swift
//  MeowMeowApp
//
//  Created by coder on 1/15/21.
//

import UIKit

class LoginView: UIView {
    
    let container: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        return container
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
