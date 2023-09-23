//
//  btManagerCentralManagerDelegate.swift
//  calsol-ios
//
//  Created by Richard Wei on 9/20/23.
//

import Foundation
import CoreBluetooth

extension btManager : CBCentralManagerDelegate{
    
    // https://learn.adafruit.com/build-a-bluetooth-app-using-swift-5?view=all
    internal struct CBUUIDs{

        static let kBLEService_UUID = "6e400001-b5a3-f393-e0a9-e50e24dcca9e"
        /*static let kBLE_Characteristic_uuid_Tx = "6e400002-b5a3-f393-e0a9-e50e24dcca9e"
        static let kBLE_Characteristic_uuid_Rx = "6e400003-b5a3-f393-e0a9-e50e24dcca9e"*/

        static let BLEService_UUID = CBUUID(string: kBLEService_UUID)
        /*static let BLE_Characteristic_uuid_Tx = CBUUID(string: kBLE_Characteristic_uuid_Tx)//(Property = Write without response)
        static let BLE_Characteristic_uuid_Rx = CBUUID(string: kBLE_Characteristic_uuid_Rx)// (Property = Read/Notify)*/
        
        static let telemetryBoardBLEIdentifier = CBUUID(string: "22302FCA-AB18-E2C8-E0F2-F57CE56E7D43") // THIS CHANGES SOMETIMES - need to switch to another way of uniquely identifying the board
    }
    
    //
    
    internal func startScanning(){
        print("started scanning")
        centralMgr?.scanForPeripherals(withServices: []);
    }
    
    internal func stopScanning(){
        centralMgr?.stopScan();
    }
    
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
    
    // CBCentralManagerDelegate
    
    internal func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        /*
         The discovered peripheral is recognized and can be stored as a CBPeripheral.
         The discovered peripheral has stored advertisement data.
         The current received signal strength indicator (RSSI) of the peripheral, in decibels.
         */
        
        if let name = peripheral.name{
            if peripheral.identifier.uuidString == CBUUIDs.telemetryBoardBLEIdentifier.uuidString{
                print(" ---- : \(name)")
                print("Peripheral discovered: \(peripheral)")
                print("Advertisement data: \(advertisementData)")
                print("RSSI: \(RSSI)")
                print(" ---- ")
                
                blePeripheral = peripheral;
                
                blePeripheral?.delegate = self;
                
                centralMgr.connect(blePeripheral!);
            }
        }
        
    }
    
    internal func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("successfully connected to peripheral \(peripheral.name)");
        stopScanning();
        blePeripheral?.discoverServices([]);
    }
    
    //
}
