//
//  layoutViewControllerMisc.swift
//  calsol-ios
//
//  Created by Richard Wei on 9/27/23.
//

import Foundation
import UIKit

extension layoutViewController{
    @objc internal func handlePan(panGesture: UIPanGestureRecognizer){
        /*
        if (panGesture.state == .began || panGesture.state == .changed){
            let translation = panGesture.translation(in: self.view);
            panGesture.setTranslation(.zero, in: self.view);
            
            print("pan values = \(translation)");
            
            updateViewFramesFromPan();
            
        }
        else if (panGesture.state == .ended){ // snap mainView to either side or return to original position
        
            let thresholdPercent : CGFloat = 0.5; // if at least 30 percent of one of the bar views are showing, then move to that otherwise move back to main view
            
            
        }
       */
        
    }
    
    private func updateViewFramesFromPan(_ mainContentViewMinX: CGFloat){
        
    }
}
