//
//  GetFromApiView.swift
//  MeowMeowApp
//
//  Created by coder on 1/14/21.
//

import UIKit

class GetFromApiView: UIView {
    
    let container: UIView = {
        let container = UIView()
        return container
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
