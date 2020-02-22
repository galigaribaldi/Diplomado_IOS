//
//  SecondViewController.swift
//  Sesion3_1
//
//  Created by Hernán Galileo Cabrera Garibaldi on 21/02/20.
//  Copyright © 2020 galios. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var deposito: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        print(deposito)
    }
    @IBAction func cerrar(_ sender: UIButton){
        //dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    

}
