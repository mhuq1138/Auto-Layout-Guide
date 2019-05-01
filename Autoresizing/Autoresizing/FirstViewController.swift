//
//  FirstViewController.swift
//  Autoresizing
//
//  Created by Mazharul Huq on 4/16/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet var redView: UIView!
    
    @IBAction func changeSizeTapped(_ sender: Any) {
        self.redView.bounds.size.width += 20
        self.redView.bounds.size.height += 20
    }
}

