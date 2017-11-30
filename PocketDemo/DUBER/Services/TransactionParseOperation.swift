//
//  TransactionParseOperation.swift
//  PocketDemo
//
//  Created by mac on 11/27/17.
//  Copyright © 2017 Pabel Nunez Landestoy. All rights reserved.
//

import Foundation

class TransactionParseOperation : NSObject {
    let transactionModel = TransactionModel.init()
    
    public func parseGetOperation(array: NSMutableArray!) -> [TransactionModel] {
        print("TransactionParseOperation - parseDownloadOperation()")
        var parsedTransactions = [TransactionModel]()
        
        for transaction in array {
            let object = transactionModel.initWith(id: String(describing: transaction),token: "")
            parsedTransactions.append(object)
        }
        return parsedTransactions
    }
    
    public func parsePostOperation(array: NSMutableArray!) -> [TransactionModel] {
        print("TransactionParseOperation - parsePostOperation()")
        var parsedTransactions = [TransactionModel]()
        
        for transaction in array {
            let object = transactionModel.initWith(id: String(describing: transaction), token: "")
            parsedTransactions.append(object)
        }
        return parsedTransactions
    }
}
