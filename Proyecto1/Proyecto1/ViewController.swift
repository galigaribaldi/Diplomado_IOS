//
//  ViewController.swift
//  Proyecto1
//
//  Created by Hernán Galileo Cabrera Garibaldi on 15/02/20.
//  Copyright © 2020 galios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter: Int = 0
    //! = boton ya existe
    
    ///Label sencillo
    @IBOutlet weak var Texto: UILabel!
    
    ///Boton activador
    @IBOutlet weak var boton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .green
        boton.layer.cornerRadius = 20
    }

    //Archivo  XML
    @IBAction func click(_ sender: UIButton) {
        counter += 1
        if counter <= 10{
        print("Click", counter) //"click \(counter)"
            Texto.text = "Click \(counter)"
        }else{
            boton.backgroundColor = .cyan
            Texto.text = "Click \(counter)"
        }
    }
    
    
}

