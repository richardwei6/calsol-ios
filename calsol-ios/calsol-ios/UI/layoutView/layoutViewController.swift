//
//  layoutViewController.swift
//  calsol-ios
//
//  Created by Richard Wei on 9/16/23.
//

import UIKit

class layoutViewController: UIViewController {

    private let mainContentVC = mainContentViewController();
    private let mainContentView = UIView();
    private let leftBarVC = leftBarViewController();
    private let leftBarView = UIView();
    
    //
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.view.backgroundColor = BackgroundColor;
        
        //
        
        setupLayout();
        
        //
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan));
        self.view.addGestureRecognizer(panGesture);
    }
    
    //
    
    private func setupLayout(){
        
        let layoutViewWidth = self.view.frame.width;
        let layoutViewHeight = self.view.frame.height;
        
        //
                
        mainContentView.frame = CGRect(x: 0, y: 0, width: layoutViewWidth, height: layoutViewHeight);
        self.view.addSubview(mainContentView);
        
        linkViewControllerToView(view: mainContentView, controller: mainContentVC, parentController: self);
        
        //
        
        let leftBarViewWidth = leftBarViewController.getLeftBarViewWidth();
        
        leftBarView.frame = CGRect(x: -leftBarViewWidth, y: 0, width: leftBarViewWidth, height: layoutViewHeight);
        self.view.addSubview(leftBarView);
        
        
    }


}

