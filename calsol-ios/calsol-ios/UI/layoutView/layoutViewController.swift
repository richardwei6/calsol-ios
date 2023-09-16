//
//  layoutViewController.swift
//  calsol-ios
//
//  Created by Richard Wei on 9/16/23.
//

import UIKit

class layoutViewController: UIViewController {

    private let mainContentView = mainContentViewController()
    private let leftBarView = leftBarViewController()
    
    //
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor = .blue;
    }


}

