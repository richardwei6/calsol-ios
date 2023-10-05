//
//  miscellaneous.swift
//  calsol-ios
//
//  Created by Richard Wei on 9/16/23.
//

import Foundation
import UIKit

// App Constants

let defaultContentViewIndex : Int = 0;
let contentViewControllers : [UIViewController] = [graphViewController()]


// Colors
let mainThemeColor = UIColor(named: "mainThemeColor")!;
let InverseBackgroundColor = UIColor(named: "InverseBackgroundColor")!;
let InverseBackgroundGrayColor = UIColor(named: "InverseBackgroundGrayColor")!;
let BackgroundGrayColor = UIColor(named: "BackgroundGrayColor")!;
let BackgroundColor = UIColor(named: "BackgroundColor")!;
//

// Macros
let btMgr = btManager.obj;
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

