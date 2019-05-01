//
//  SecondViewController.swift
//  Autoresizing
//
//  Created by Mazharul Huq on 4/16/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var redView: UIView!
    @IBOutlet var blueView: UIView!
    @IBOutlet var greenView: UIView!
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.redView.autoresizingMask =  [.flexibleLeftMargin,  .flexibleBottomMargin,.flexibleRightMargin, .flexibleTopMargin ]
        self.blueView.autoresizingMask = [.flexibleBottomMargin, .flexibleWidth]
        self.greenView.autoresizingMask =  [.flexibleLeftMargin, .flexibleHeight, .flexibleWidth]
        self.button.autoresizingMask = [.flexibleLeftMargin,.flexibleBottomMargin, .flexibleRightMargin, .flexibleTopMargin]
    }

    @IBAction func changeSizeTapped(_ sender: Any) {
        self.redView.bounds.size.width += 30
        self.redView.bounds.size.height += 30
    }
    
}

