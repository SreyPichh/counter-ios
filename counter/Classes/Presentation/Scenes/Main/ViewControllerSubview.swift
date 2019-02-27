//
//  ViewControllerSubview.swift
//  counter
//
//  Created by Pich on 2/27/19.
//  Copyright © 2019 pich. All rights reserved.
//

import SnapKit
import Then

class ViewControllerSubview {
    let addBtn = UIButton().then{
        $0.setTitle("+", for: .normal)
        $0.layer.backgroundColor = UIColor.lightGray.cgColor
        $0.layer.cornerRadius = 5.0
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.white.cgColor
    }
    let counterLabel = UILabel().then{
        $0.text = "0"
    }
    let minusBtn = UIButton().then{
        $0.setTitle("-", for: .normal)
        $0.layer.backgroundColor = UIColor.lightGray.cgColor
        $0.layer.cornerRadius = 5.0
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.white.cgColor
    }
    
    let header = UILabel().then{
        $0.text = "Counter App"
    }
    
    
    func updatedConstraints() {
        self.addBtn.snp.makeConstraints { (make) in
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(80)
        }
        self.minusBtn.snp.makeConstraints { (make) in
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-85)
        }
        self.counterLabel.snp.makeConstraints { (make) in
            make.width.equalTo(30)
            make.height.equalTo(50)
            make.center.equalToSuperview()
        }
        self.header.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
        }
    }
    
}
