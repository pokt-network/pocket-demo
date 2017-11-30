//
//  TransactionPostOperation.swift
//  PocketDemo
//
//  Created by mac on 11/27/17.
//  Copyright © 2017 Pabel Nunez Landestoy. All rights reserved.
//

import Foundation
import SwiftyJSON

class TransactionPostOperation : NSObject {
    //    typealias CompletionHandler = (_ transactions: [TransactionModel]) -> Void
    typealias CompletionHandler = (_ transactions: NSDictionary) -> Void
    
    public func PostRequest(url: String!, path: String!, transaction: TransactionModel, completionHandler: @escaping CompletionHandler ) {
        print("BaseOperation - PostRequest()")
        
        let params = ["token": transaction.token, "transaction": transaction.id ] as! Dictionary<String, String>
        
        var request = URLRequest(url: URL(string: url+path)!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let json = try JSON(data: data!)
                let dict = json.dictionaryObject! as NSDictionary
                completionHandler(dict)
                print(dict.debugDescription)
            } catch {
                print("error")
            }
        })
        
        task.resume()

    }
}
