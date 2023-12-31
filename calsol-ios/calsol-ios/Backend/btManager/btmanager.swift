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
    
    internal static let telemetryBoardBLEDeviceName = "BLETelemetry1";
    
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
            print("BLE Error = Device unsupported")
        case .unauthorized:
            print("BLE Error = App unauthorized")
        case .unknown:
            print("BLE Error = State unknown error")
        @unknown default:
            print("BLE Error = Unknown error")
        }
    }

    internal func getCentralMgrState() -> CBManagerState{
        return centralMgr.state;
    }
}
