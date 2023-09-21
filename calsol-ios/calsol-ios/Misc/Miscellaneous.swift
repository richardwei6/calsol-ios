//
//  miscellaneous.swift
//  calsol-ios
//
//  Created by Richard Wei on 9/16/23.
//

import Foundation
import UIKit

// Colors
let mainThemeColor = UIColor(named: "mainThemeColor")!;
let InverseBackgroundColor = UIColor(named: "InverseBackgroundColor")!;
let InverseBackgroundGrayColor = UIColor(named: "InverseBackgroundGrayColor")!;
let BackgroundGrayColor = UIColor(named: "BackgroundGrayColor")!;
let BackgroundColor = UIColor(named: "BackgroundColor")!;
//

// Functions
internal func linkViewControllerToView(view: UIView, controller: UIViewController, parentController: UIViewController){
    controller.willMove(toParent: parentController);
    controller.view.frame = view.bounds;
    view.addSubview(controller.view);
    parentController.addChild(controller);
    controller.didMove(toParent: parentController);
}
//