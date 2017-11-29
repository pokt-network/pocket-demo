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
    override func viewDidLoad() {
        super.viewDidLoad()
        request.layer.cornerRadius = request.frame.size.height / 2
        // Do any additional setup after loading the view.
    }
}
