//
//  MainViewController.swift
//  PocketDemo
//
//  Created by Michael O'Rourke on 11/27/17.
//  Copyright © 2017 Pabel Nunez Landestoy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var request: UIButton!
    @IBOutlet weak var walletAddressLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        request.layer.cornerRadius = request.frame.size.height / 2
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

//        self.setWalletAddress()
//        self.setWalletAmmount()
    }
    
    func setWalletAddress() {
        if let transactionsArray = UserDefaults.standard.array(forKey: "transactions") {
            if transactionsArray.count > 0 {
                self.walletAddressLabel.text = transactionsArray.first as? String
            }else{
                print("MainViewController - viewWillAppear() - 0 Transactions in UserDefaults")
            }
        }else {
            print("MainViewController - viewWillAppear() - Failed to retrieve transactions from UserDefaults")
        }
    }
    
    func setWalletAmmount() {
        self.amountLabel.text = String(arc4random_uniform(42))
    }
    
    @IBAction func RequestButtonAction(_ sender: Any) {
        print("MainViewController - RequestButtonAction()")
        var signedTransaction = ""
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let invoiceViewController = storyboard.instantiateViewController(withIdentifier: "invoiceViewControllerID") as! InvoiceViewController
        let index = UserDefaults.standard.integer(forKey: "index")
        
        print("MainViewController - RequestButtonAction() - Transaction Index = \(index)")
        
        if let transactionsArray = UserDefaults.standard.array(forKey: "transactions") {
            if transactionsArray.count > 0 {
                print("MainViewController - RequestButtonAction() - Retrieved Transactions: \(transactionsArray.count)")
                if index < transactionsArray.count {
                    signedTransaction = (transactionsArray[index] as? String ?? "")
                    UserDefaults.standard.set(index + 1, forKey: "index")
                    
                    print("MainViewController - RequestButtonAction() - Signed transaction = \(signedTransaction)")
                    
                }else {
                    print("MainViewController - RequestButtonAction() - No more transactions, fetching a new batch")
                    let appDelegate = AppDelegate.init()
                    appDelegate.fetchTransactions()
                }
            }else {
                print("MainViewController - viewWillAppear() - 0 Transactions in UserDefaults")
            }
        }else {
            print("MainViewController - viewWillAppear() - Failed to retrieve transactions from UserDefaults")
        }
        invoiceViewController.signedTransaction = signedTransaction
        
        if signedTransaction != "" {
            self.present(invoiceViewController, animated: true, completion: nil)
        }
    }
}
