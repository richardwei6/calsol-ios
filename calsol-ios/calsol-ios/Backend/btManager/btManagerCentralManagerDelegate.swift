//
//  btManagerCentralManagerDelegate.swift
//  calsol-ios
//
//  Created by Richard Wei on 9/20/23.
//

import Foundation
import CoreBluetooth

extension btManager : CBCentralManagerDelegate{
    // CBCentralManagerDelegate
    
    internal func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state{
        case .poweredOff:
            print("BT OFF")
        case .poweredOn:
            print("BT ON")
        case .resetting:
            print("Resetting BT")
        default: // only called if an error occurred
            errorHandler(central.state);
        }
    }
    
    internal func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        /*
         The discovered peripheral is recognized and can be stored as a CBPeripheral.
         The discovered peripheral has stored advertisement data.
         The current received signal strength indicator (RSSI) of the peripheral, in decibels.
         */
        
        if peripheral.name != nil{
            print(" ---- : \(peripheral.name)")
            print("Peripheral discovered: \(peripheral)")
            print("Advertisement data: \(advertisementData)")
            print(" ---- ")
        }
        
    }
}
