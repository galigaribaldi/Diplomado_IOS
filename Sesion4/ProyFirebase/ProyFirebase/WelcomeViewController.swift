//
//  WelcomeViewController.swift
//  ProyFirebase
//
//  Created by Hernán Galileo Cabrera Garibaldi on 07/03/20.
//  Copyright © 2020 galios. All rights reserved.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signOut(_ sender: Any){
        var salida = try! Auth.auth().signOut()
        navigationController?.popViewController(animated: true)
    }
}
