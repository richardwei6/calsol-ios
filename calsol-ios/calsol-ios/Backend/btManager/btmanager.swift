//
//  btmanager.swift
//  calsol-ios
//
//  Created by Richard Wei on 9/20/23.
//

import Foundation
import UIKit
import CoreBluetooth


// Core Bluetooth Manager
class btManager : NSObject{
    static public let obj = btManager();
    
    //
    
    internal var centralManager : CBCentralManager!;
    
    //
    
    private override init(){
        super.init();
        print("created new instance of btManager")
        centralManager = CBCentralManager(delegate: self, queue: nil);
    }
    
    //
    
    internal func errorHandler(_ centralManagerState: CBManagerState){
        switch centralManagerState {
        case .unsupported:
            print("Device unsupported")
        case .unauthorized:
            print("App unauthorized")
        case .unknown:
            print("State unknown error")
        @unknown default:
            print("Unknown error")
        }
    }
    
}
