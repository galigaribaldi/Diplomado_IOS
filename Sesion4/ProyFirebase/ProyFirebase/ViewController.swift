//
//  ViewController.swift
//  ProyFirebase
//
//  Created by Hernán Galileo Cabrera Garibaldi on 06/03/20.
//  Copyright © 2020 galios. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwdTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: UIButton){
        guard let email = emailTF.text, email != "", let password = passwdTF.text, password != "" else{
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            print("Usuario creado", user?.user.uid)
        }
    }
    
    @IBAction func cancel(_ sender: UIButton){
        
    }

}

