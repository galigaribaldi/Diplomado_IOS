//
//  LoginViewController.swift
//  ProyFirebase
//
//  Created by Hernán Galileo Cabrera Garibaldi on 07/03/20.
//  Copyright © 2020 galios. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwdTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func login(_ sender: UIButton){
        guard let email = emailTF.text, email != "", let password = passwdTF.text, password != "" else{
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }else{
                print("usuario logeado")
                let welcomeView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "WelcomeViewController") as? WelcomeViewController
                //self.navigationController?.pushViewController(welcomeView!, animated: true)
                //self.present(welcomeView!, animated: true, completion: nil)
                self.dismiss(animated: true){
                    self.navigationController?.pushViewController(welcomeView!, animated: true)
                }
            }
        }
    }
    @IBAction func cancel(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }

}
