//
//  EqualSpacingWithLayoutGuideVC.swift
//  Safe Area Margins and Guides
//
//  Created by Mazharul Huq on 4/26/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class EqualSpacingWithLayoutGuideVC: UIViewController {
    @IBOutlet var redView: UIView!
    @IBOutlet var blueView: UIView!
    @IBOutlet var greenView: UIView!
    @IBOutlet var orangeView: UIView!
    
    var guide1 = UILayoutGuide()
    var guide2 = UILayoutGuide()
    var guide3 = UILayoutGuide()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addLayoutGuide(self.guide1)
        self.view.addLayoutGuide(self.guide2)
        self.view.addLayoutGuide(self.guide3)
        self.setupLayoutGuides()
        self.setupConstraints()
    }
    
    func setupLayoutGuides(){
        self.guide1.heightAnchor.constraint(equalToConstant:50).isActive = true
        self.guide1.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant:250).isActive = true
        self.guide2.heightAnchor.constraint(equalToConstant:50).isActive = true
        self.guide2.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant:250).isActive = true
        self.guide3.heightAnchor.constraint(equalToConstant:50).isActive = true
        self.guide3.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant:250).isActive = true
        self.guide2.widthAnchor.constraint(equalTo: guide1.widthAnchor).isActive = true
        self.guide3.widthAnchor.constraint(equalTo: guide1.widthAnchor).isActive = true
    }
    
    func setupConstraints(){
        self.redView.trailingAnchor.constraint(equalTo: self.guide1.leadingAnchor).isActive = true
        self.blueView.leadingAnchor.constraint(equalTo: self.guide1.trailingAnchor).isActive = true
        self.blueView.trailingAnchor.constraint(equalTo: self.guide2.leadingAnchor).isActive = true
        self.greenView.leadingAnchor.constraint(equalTo: self.guide2.trailingAnchor).isActive = true
        self.greenView.trailingAnchor.constraint(equalTo: self.guide3.leadingAnchor).isActive = true
        self.orangeView.leadingAnchor.constraint(equalTo: self.guide3.trailingAnchor).isActive = true
    }


}
