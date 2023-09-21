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
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
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
}
