//
//  MyView.swift
//  Manual Layout
//
//  Created by Mazharul Huq on 4/16/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class MyView: UIView {

    var topView = UIView()
    var rightView = UIView()
    var button = UIButton()
    var width:CGFloat = 0.0
    var height:CGFloat = 0.0
    
    override func draw(_ rect: CGRect) {
        
        self.topView.backgroundColor = .blue
        self.addSubview(self.topView)
        
        self.rightView.backgroundColor = .green
        self.addSubview(self.rightView)
        
        self.button.setTitle("Change Size", for: .normal)
        self.button.setTitleColor(.white, for: .normal)
        self.button.sizeToFit()
        self.topView.addSubview(self.button)
        self.button.addTarget(self, action: #selector(changeSizeTapped), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.width = self.bounds.width/3.0
        self.height = self.bounds.height/10.0
        self.rightView.frame = CGRect(x: 2.0*self.width, y: self.height, width: self.width, height: 9.0*self.height )
        self.topView.frame = CGRect(x: 0.0, y: 0.0, width: self.bounds.width, height: self.height)
        self.button.center = CGPoint(x: self.topView.bounds.midX, y: self.topView.bounds.midY)
    }
    
    @objc func changeSizeTapped() {
        self.bounds.size.width += 30
        self.bounds.size.height += 30
    }
    

}
