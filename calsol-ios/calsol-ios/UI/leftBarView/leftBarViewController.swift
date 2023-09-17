//
//  leftBarViewController.swift
//  calsol-ios
//
//  Created by Richard Wei on 9/16/23.
//

import Foundation
import UIKit

class leftBarViewController : UIViewController{
        
    //
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
    }
    
    //
    
    public static func getLeftBarViewWidth() -> CGFloat{
        return AppUtility.getCurrentScreenSize().width;
    }
    
}
