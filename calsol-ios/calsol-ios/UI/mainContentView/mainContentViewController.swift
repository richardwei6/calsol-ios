//
//  mainContentViewController.swift
//  calsol-ios
//
//  Created by Richard Wei on 9/16/23.
//

import Foundation
import UIKit

class mainContentViewController : UIViewController{
    
    internal let mainScrollView = UIScrollView();
    
    //
    
    @objc func handleTestClick(_ sender: UIButton){
        print("test");
        btMgr.scan();
    }
    
    //
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        //
        
        /*let testButtonWidth = self.view.frame.width * 0.4
        let testButtonHeight = testButtonWidth * 0.6
        let testButtonFrame = CGRect(x: (self.view.frame.width / 2) - (testButtonWidth / 2), y: (self.view.frame.height / 2), width: testButtonWidth, height: testButtonHeight);
        let testButton = UIButton(frame: testButtonFrame);
        
        testButton.setTitle("Click here to test", for: .normal)
        testButton.setTitleColor(.black, for: .normal)
        testButton.titleLabel?.textAlignment = .center
        testButton.backgroundColor = .systemBlue
        testButton.layer.cornerRadius = testButtonWidth / 10
        
        testButton.addTarget(self, action: #selector(self.handleTestClick), for: .touchUpInside)
        
        self.view.addSubview(testButton);*/
        
        //
        
        renderMainScrollView();
    }
    
    //
    
    internal func renderMainScrollView(){
        
        let mainScrollViewFrame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height);
        mainScrollView.frame = mainScrollViewFrame;
        
        mainScrollView.backgroundColor = .systemRed
        
        self.view.addSubview(mainScrollView);
    }
    
}
