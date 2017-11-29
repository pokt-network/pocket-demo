//
//  TransactionGetOperation.swift
//  PocketDemo
//
//  Created by mac on 11/27/17.
//  Copyright © 2017 Pabel Nunez Landestoy. All rights reserved.
//

import Foundation

class TransactionGetOperation: NSObject {
    typealias CompletionHandler = (_ transactions: [TransactionModel]) -> Void
    
    public func GetRequest(url: String!, path: String!, completionHandler: CompletionHandler) {
        print("TransactionGetOperation - GetRequest()")
        
        var request = URLRequest(url: URL(string: url)!)
        let transactions = NSMutableArray()
        let parseOperation = TransactionParseOperation.init()
        var parsedTransactions = [TransactionModel]()
        
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [JSONSerialization.ReadingOptions.allowFragments])
                
                guard let newValue = json as? [String: Any] else {
                    print("invalid format")
                    return
                }
                if newValue["transactions"] == nil{
                    return
                }
                let test = newValue["transactions"] as! NSMutableArray
                
                for transactionDict in test {
                    transactions.add(transactionDict)
                }
                
                if transactions.count > 0 {
                    print("Transactions count: \(transactions.count)")
                    parsedTransactions = parseOperation.parseGetOperation(array: transactions)
                }else{
                    print("Transactions count: \(transactions.count), returning...")
                }
//                completionHandler(parsedTransactions)
                
            } catch {
                print("error: \(error)")
            }
        })
        task.resume()
    }
}
