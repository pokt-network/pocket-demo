//
//  TransactionModel.swift
//  PocketDemo
//
//  Created by mac on 11/27/17.
//  Copyright © 2017 Pabel Nunez Landestoy. All rights reserved.
//

import Foundation

class TransactionModel: NSObject {
    var id: String!
    var token: String!
    
    func initWith(id: String!, token: String!) -> TransactionModel {
        self.id = "0x"+id
        
        if token == "" {
            self.token = "ETH"
        }else{
            self.token = token
        }
        
        return self
    }
}


