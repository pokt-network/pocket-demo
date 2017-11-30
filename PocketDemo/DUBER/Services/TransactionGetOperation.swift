//
//  TransactionGetOperation.swift
//  PocketDemo
//
//  Created by mac on 11/27/17.
//  Copyright © 2017 Pabel Nunez Landestoy. All rights reserved.
//

import Foundation
import SwiftyJSON

class TransactionGetOperation: NSObject {
//    typealias CompletionHandler = (_ transactions: [TransactionModel]) -> Void
    typealias CompletionHandler = (_ transactions: NSMutableArray) -> Void
    
    public func GetRequest(url: String!, path: String!, completionHandler: @escaping CompletionHandler) {
        print("TransactionGetOperation - GetRequest()")
        
        var request = URLRequest(url: URL(string: url + path)!)
        let transactions = NSMutableArray()
//        let parseOperation = TransactionParseOperation.init()
//        var parsedTransactions = [TransactionModel]()
        var parsedTransactions = NSMutableArray()
        
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let json = try JSON(data: data!)
                
                let array =  json["transactions"].arrayObject
                
                for transactionDict in array! {
                    transactions.add(transactionDict)
                }
                
                if transactions.count > 0 {
                    print("Transactions count: \(transactions.count)")
//                    parsedTransactions = parseOperation.parseGetOperation(array: transactions)
                    parsedTransactions = transactions
                }else{
                    print("Transactions count: \(transactions.count), returning...")
                }
                completionHandler(parsedTransactions)
                
            } catch {
                print("error: \(error)")
            }
        })
        task.resume()
    }
}
