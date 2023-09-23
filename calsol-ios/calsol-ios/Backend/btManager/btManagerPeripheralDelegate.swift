//
//  btManagerPeripheralDelegate.swift
//  calsol-ios
//
//  Created by Richard Wei on 9/20/23.
//

import Foundation
import CoreBluetooth

extension btManager : CBPeripheralDelegate{
    
    // https://learn.adafruit.com/build-a-bluetooth-app-using-swift-5?view=all
    internal struct CBUUIDs{

        static let kBLEService_UUID = "6e400001-b5a3-f393-e0a9-e50e24dcca9e"
        static let kBLE_Characteristic_uuid_Tx = "6e400002-b5a3-f393-e0a9-e50e24dcca9e"
        static let kBLE_Characteristic_uuid_Rx = "6e400003-b5a3-f393-e0a9-e50e24dcca9e"

        static let BLEService_UUID = CBUUID(string: kBLEService_UUID)
        static let BLE_Characteristic_uuid_Tx = CBUUID(string: kBLE_Characteristic_uuid_Tx)//(Property = Write without response)
        static let BLE_Characteristic_uuid_Rx = CBUUID(string: kBLE_Characteristic_uuid_Rx)// (Property = Read/Notify)
    }
    
    //
    
    internal func startScanning(){
        print("started scanning")
        centralMgr?.scanForPeripherals(withServices: []);
    }
    
}
