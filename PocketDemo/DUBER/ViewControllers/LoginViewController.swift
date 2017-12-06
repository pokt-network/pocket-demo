//
//  LoginViewController.swift
//  PocketDemo
//
//  Created by Michael O'Rourke on 11/27/17.
//  Copyright © 2017 Pabel Nunez Landestoy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        username.attributedPlaceholder = NSAttributedString(string: "Username",
                                                               attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        password.attributedPlaceholder = NSAttributedString(string: "Password",
                                                            attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        signIn.layer.cornerRadius = signIn.frame.size.height / 2
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signinButtonAction(_ sender: Any) {
        
        if self.username.text == "pocket" && self.password.text == "network" {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainViewController = storyboard.instantiateViewController(withIdentifier: "mainViewControllerID")
            
            self.navigationController?.present(mainViewController, animated: true, completion: nil)
            
        }else {
            
            let alertController = UIAlertController(title: "Invalid Login", message: "", preferredStyle: UIAlertControllerStyle.alert) //Replace UIAlertControllerStyle.Alert by UIAlertControllerStyle.alert
            
            // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                (result : UIAlertAction) -> Void in
                print("OK")
            }
            
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
