//
//  SafeAreaInIBVC.swift
//  Safe Area Margins and Guides
//
//  Created by Mazharul Huq on 4/25/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class SafeAreaInIBVC: UIViewController {

        @IBOutlet var redView: UIView!
        @IBOutlet var blueView: UIView!
 
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            print(self.redView.safeAreaInsets)
            print(self.blueView.safeAreaInsets)
        }
}
