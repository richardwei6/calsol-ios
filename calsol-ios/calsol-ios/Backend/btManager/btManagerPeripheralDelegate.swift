//
//  btManagerPeripheralDelegate.swift
//  calsol-ios
//
//  Created by Richard Wei on 9/20/23.
//

import Foundation
import CoreBluetooth

extension btManager : CBPeripheralDelegate{
    
    internal func disconnectPeripheral(){
        if let peripheral = blePeripheral {
            print("disconnected peripheral");
            centralMgr?.cancelPeripheralConnection(peripheral);
        }
    }
    
    private func discoverCharacteristicsFor(services: [CBService], _ peripheral: CBPeripheral){
        //discover the all characteristics of each of the services
        for service in services {
            peripheral.discoverCharacteristics(nil, for: service);
        }
    }
    
    // CBPeripheralDelegate
    
    internal func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if error != nil{
            print("Error discovering services: \(error?.localizedDescription)");
            return;
        }
        
        guard let services = peripheral.services else{
            return;
        }
        
        discoverCharacteristicsFor(services: services, peripheral);
        
        //
        
        print("Discovered services: \(services)")
        
    }
    
    internal func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        print("discovered characteristics for \(service)")
        print(" -> \(service.characteristics)")
        print(service.characteristics?[0].value)
    }
    
    internal func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?){
        //var characteristicASCIIValue = NSString()
    }
    
}
