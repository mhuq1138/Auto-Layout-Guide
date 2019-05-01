//
//  ViewTreeWithLayoutGuideVC.swift
//  Safe Area Margins and Guides
//
//  Created by Mazharul Huq on 4/26/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewTreeWithLayoutGuideVC: UIViewController {

    @IBOutlet var orangeLeft: UIView!
    @IBOutlet var orangeRight: UIView!
    @IBOutlet var greenLeft: UIView!
    @IBOutlet var greenRight: UIView!
    @IBOutlet var blueLeft: UIView!
    @IBOutlet var blueRight: UIView!
    @IBOutlet var redLeft: UIView!
    @IBOutlet var redRight: UIView!
    
    var trunkGuide = UILayoutGuide()
    var separatorLeft1 = UILayoutGuide()
    var separatorLeft2 = UILayoutGuide()
    var separatorLeft3 = UILayoutGuide()
    var separatorRight1 = UILayoutGuide()
    var separatorRight2 = UILayoutGuide()
    var separatorRight3 = UILayoutGuide()
    
    @IBOutlet var topConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupGuides()
        self.setConstraints()
    }
    
    func setupGuides(){
        self.view.addLayoutGuide(self.trunkGuide)
        self.view.addLayoutGuide(self.separatorLeft1)
        self.view.addLayoutGuide(self.separatorLeft2)
        self.view.addLayoutGuide(self.separatorLeft3)
        self.view.addLayoutGuide(self.separatorRight1)
        self.view.addLayoutGuide(self.separatorRight2)
        self.view.addLayoutGuide(self.separatorRight3)
        
        self.trunkGuide.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        self.trunkGuide.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        self.trunkGuide.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.trunkGuide.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        self.separatorLeft1.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        self.separatorLeft1.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        self.separatorLeft1.trailingAnchor.constraint(equalTo: self.trunkGuide.leadingAnchor).isActive = true
        
        self.separatorLeft2.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        self.separatorLeft2.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        self.separatorLeft2.trailingAnchor.constraint(equalTo: self.trunkGuide.leadingAnchor).isActive = true
        
        self.separatorLeft3.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        self.separatorLeft3.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        self.separatorLeft3.trailingAnchor.constraint(equalTo: self.trunkGuide.leadingAnchor).isActive = true
        
        self.separatorRight1.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        self.separatorRight1.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        self.separatorRight1.leadingAnchor.constraint(equalTo: self.trunkGuide.trailingAnchor).isActive = true
        
        self.separatorRight2.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        self.separatorRight2.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        self.separatorRight2.leadingAnchor.constraint(equalTo: self.trunkGuide.trailingAnchor).isActive = true
        
        self.separatorRight3.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        self.separatorRight3.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        self.separatorRight3.leadingAnchor.constraint(equalTo: self.trunkGuide.trailingAnchor).isActive = true
        
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([self.orangeLeft.trailingAnchor.constraint(equalTo: self.trunkGuide.leadingAnchor),
            self.orangeLeft.bottomAnchor.constraint(equalTo: self.separatorLeft1.topAnchor),
            self.orangeRight.leadingAnchor.constraint(equalTo: self.trunkGuide.trailingAnchor),
            self.orangeRight.bottomAnchor.constraint(equalTo: self.separatorRight1.topAnchor),
            
            self.greenLeft.trailingAnchor.constraint(equalTo: self.trunkGuide.leadingAnchor),
            self.greenLeft.topAnchor.constraint(equalTo: self.separatorLeft1.bottomAnchor),
            self.greenLeft.bottomAnchor.constraint(equalTo: self.separatorLeft2.topAnchor),
            
            self.greenRight.leadingAnchor.constraint(equalTo: self.trunkGuide.trailingAnchor),
            self.greenRight.topAnchor.constraint(equalTo: self.separatorRight1.bottomAnchor),
            self.greenRight.bottomAnchor.constraint(equalTo: self.separatorRight2.topAnchor),
            
            self.blueLeft.trailingAnchor.constraint(equalTo: self.trunkGuide.leadingAnchor),
            self.blueLeft.topAnchor.constraint(equalTo: self.separatorLeft2.bottomAnchor),
            self.blueLeft.bottomAnchor.constraint(equalTo: self.separatorLeft3.topAnchor),
            
            self.blueRight.leadingAnchor.constraint(equalTo: self.trunkGuide.trailingAnchor),
            self.blueRight.topAnchor.constraint(equalTo: self.separatorRight2.bottomAnchor),
            self.blueRight.bottomAnchor.constraint(equalTo: self.separatorRight3.topAnchor),
            
            self.redLeft.trailingAnchor.constraint(equalTo: self.trunkGuide.leadingAnchor),
            self.redLeft.topAnchor.constraint(equalTo: self.separatorLeft3.bottomAnchor),
            
            
            self.redRight.leadingAnchor.constraint(equalTo: self.trunkGuide.trailingAnchor),
            self.redRight.topAnchor.constraint(equalTo: self.separatorRight3.bottomAnchor)])
        
        
        
        
        
    }
    
    @IBAction func moveTapped(_ sender: Any) {
        if self.topConstraint.constant == 40.0 {
            self.topConstraint.constant = 90.0
        }
        else{
            self.topConstraint.constant = 40.0
        }
    }
    
    

}
