//
//  mainContentViewController.swift
//  calsol-ios
//
//  Created by Richard Wei on 9/16/23.
//

import Foundation
import UIKit

class mainContentViewController : UIViewController{
    
    internal var contentViewIndex = -1;
    
    internal let mainContentView = UIView();
    
    //
    
    @objc func handleTestClick(_ sender: UIButton){
        print("test");
        btMgr.scan();
    }
    
    public func updateContentIndex(_ newIndex: Int){
        guard newIndex > -1 && newIndex < contentViewControllers.count else{
            print("ERROR updating content index - \(newIndex) is out of bounds");
            return;
        }
        
        if contentViewIndex != -1{
            clearMainContentView();
        }
        
        contentViewIndex = newIndex;
        updateMainContentView();
    }
    
    //
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        //
        
        let testButtonWidth = self.view.frame.width * 0.4
        let testButtonHeight = testButtonWidth * 0.6
        let testButtonFrame = CGRect(x: (self.view.frame.width / 2) - (testButtonWidth / 2), y: (self.view.frame.height / 2), width: testButtonWidth, height: testButtonHeight);
        let testButton = UIButton(frame: testButtonFrame);
        
        testButton.setTitle("Click here to test", for: .normal)
        testButton.setTitleColor(.black, for: .normal)
        testButton.titleLabel?.textAlignment = .center
        testButton.backgroundColor = .systemBlue
        testButton.layer.cornerRadius = testButtonWidth / 10
        
        testButton.addTarget(self, action: #selector(self.handleTestClick), for: .touchUpInside)
        
        self.view.addSubview(testButton);
        
        //
        
        /*let mainContentViewFrame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height);
        mainContentView.frame = mainContentViewFrame;
        
        //mainContentView.backgroundColor = .systemRed
        
        self.view.addSubview(mainContentView);
        
        //
        
        updateContentIndex(defaultContentViewIndex);*/
    }
    
    internal func clearMainContentView(){
        let previousVC = contentViewControllers[contentViewIndex];
        
        for subview in self.view.subviews{
            subview.removeFromSuperview();
        }
        
        previousVC.willMove(toParent: nil);
        previousVC.view.removeFromSuperview();
        previousVC.removeFromParent();
    }
    
    internal func updateMainContentView(){
        let vc = contentViewControllers[contentViewIndex];
        linkViewControllerToView(view: mainContentView, controller: vc, parentController: self);
    }
    
}
