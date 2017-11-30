//
//  InvoiceViewController.swift
//  PocketDemo
//
//  Created by Michael O'Rourke on 11/27/17.
//  Copyright © 2017 Pabel Nunez Landestoy. All rights reserved.
//

import UIKit

class InvoiceViewController: UIViewController {
    var signedTransaction: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CompleteTripAction(_ sender: Any) {
        let postOperation = TransactionPostOperation.init()
        let transaction = TransactionModel.init()
        var status = ""
        
        transaction.id = self.signedTransaction
        transaction.token = "ETH"
        
        postOperation.PostRequest(url: "https://pkt-node-demo.herokuapp.com", path: "/relay", transaction: transaction) { (response) in
            
            if response.value(forKey: "isRejected") != nil {
                status = "Transaction Failed"
                print(status)
            }else{
                status = "Transaction Completed"
                print(status)
            }
            
            let alertController = UIAlertController(title: status, message: "", preferredStyle: UIAlertControllerStyle.alert) //Replace UIAlertControllerStyle.Alert by UIAlertControllerStyle.alert
            
            // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                (result : UIAlertAction) -> Void in
                print("OK")
            }
            
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
