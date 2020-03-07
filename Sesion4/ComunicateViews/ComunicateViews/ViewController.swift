//
//  ViewController.swift
//  ComunicateViews
//
//  Created by Hernán Galileo Cabrera Garibaldi on 06/03/20.
//  Copyright © 2020 galios. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SecondViewControllerDelegete {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func toSecondView(_ sender: UIButton){
        //Del Storyborad original jalate de un identificador llamado SeocndViewControler, pero como es generico, solo se castea
        let secondView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SecondViewController") as? SecondViewController
        
        secondView?.delegate = self
        present(secondView!, animated: true)
    }
    func showData(_ name: String) {
        print(name)
    }
    

}

