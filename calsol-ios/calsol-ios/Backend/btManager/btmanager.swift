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
    
    internal var centralMgr : CBCentralManager!;
    internal var blePeripheral : CBPeripheral? = nil;
    
    //
    
    private override init(){
        super.init();
        print("created new instance of btManager")
        centralMgr = CBCentralManager(delegate: self, queue: nil);
    }
    
    //
    
    public func scan(){
        if getCentralMgrState() != .poweredOn{
            print("BT not in 'ON' state");
            return;
        }
        
        startScanning();
    }
    
    public func isConnectedToBoard() -> Bool{
        return blePeripheral != nil && blePeripheral!.state == .connected;
    }
    
    public func disconnectFromBoard(){
        disconnectPeripheral();
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

    internal func getCentralMgrState() -> CBManagerState{
        return centralMgr.state;
    }
}
