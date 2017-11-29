//
//  TransactionPostOperation.swift
//  PocketDemo
//
//  Created by mac on 11/27/17.
//  Copyright © 2017 Pabel Nunez Landestoy. All rights reserved.
//

import Foundation

class TransactionPostOperation : NSObject {
    
    public func PostRequest(url: String!, path: String!, transaction: TransactionModel ) -> NSDictionary {
        print("BaseOperation - PostRequest()")
        
        let params = ["token": transaction.token, "transaction": transaction.id ] as! Dictionary<String, String>
        let dict = NSDictionary()
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                print(json)
            } catch {
                print("error")
            }
        })
        
        task.resume()
        return dict
    }
}
