//
//  TransactionParseOperation.swift
//  PocketDemo
//
//  Created by mac on 11/27/17.
//  Copyright © 2017 Pabel Nunez Landestoy. All rights reserved.
//

import Foundation

class TransactionParseOperation : NSObject {
    
    public func parseGetOperation(array: NSMutableArray!) -> [TransactionModel] {
        print("parseDownloadOperation()")
        var parsedTransactions = [TransactionModel]()
        
        for transaction in array {
            if let object = TransactionModel.deserialize(from: transaction as! Dictionary<String, String>) {
                parsedTransactions.append(object)
            }else{
                print("Failed to parse transaction")
            }
        }
        return parsedTransactions
    }
    
    public func parseDownloadOperation(array: NSMutableArray!) -> [TransactionModel] {
        print("parseDownloadOperation()")
        var parsedTransactions = [TransactionModel]()
        
        for transaction in array {
            if let object = TransactionModel.deserialize(from: transaction as! Dictionary<String, String>) {
                parsedTransactions.append(object)
            }else{
                print("Failed to parse transaction")
            }
        }
        return parsedTransactions
    }
}
