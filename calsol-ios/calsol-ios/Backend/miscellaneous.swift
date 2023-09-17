//
//  miscellaneous.swift
//  calsol-ios
//
//  Created by Richard Wei on 9/16/23.
//

import Foundation
import UIKit

// Functions
internal func linkViewControllerToView(view: UIView, controller: UIViewController, parentController: UIViewController){
    controller.willMove(toParent: parentController);
    controller.view.frame = view.bounds;
    view.addSubview(controller.view);
    parentController.addChild(controller);
    controller.didMove(toParent: parentController);
}
//
