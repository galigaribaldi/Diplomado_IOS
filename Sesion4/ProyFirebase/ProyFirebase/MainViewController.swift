//
//  MainViewController.swift
//  ProyFirebase
//
//  Created by Hernán Galileo Cabrera Garibaldi on 07/03/20.
//  Copyright © 2020 galios. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //isLogged()
    }
    func isLogged(){
        Auth.auth().addStateDidChangeListener{ (auth, user) in
            if user == nil{
                print("Usuario no logeado")
                return
            }else{
                print("usuario Loggeado")
                self.performSegue(withIdentifier: "WelcomeView", sender: self)
            }
        }
    }
}
