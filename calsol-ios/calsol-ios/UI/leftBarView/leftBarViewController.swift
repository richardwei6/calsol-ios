//
//  leftBarViewController.swift
//  calsol-ios
//
//  Created by Richard Wei on 9/16/23.
//

import Foundation
import UIKit

class leftBarViewController : UIViewController{
        
    internal let leftBarScrollView = UIScrollView();
    
    //

    public static func getLeftBarViewWidth() -> CGFloat{
        return AppUtility.getCurrentScreenSize().width / 2;
    }
    
    //
    override func viewDidLoad() {
        super.viewDidLoad();
        
        //
        
        let leftBarScrollViewFrame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height);
        leftBarScrollView.frame = leftBarScrollViewFrame;
        
        leftBarScrollView.backgroundColor = .systemBlue;
        
        self.view.addSubview(leftBarScrollView);
        
        //
        
        renderBarContent();
    }
    
    //
    
    internal func renderBarContent(){
        
    }
}
