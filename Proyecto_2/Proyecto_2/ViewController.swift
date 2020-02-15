//
//  ViewController.swift
//  Proyecto_2
//
//  Created by Hernán Galileo Cabrera Garibaldi on 15/02/20.
//  Copyright © 2020 galios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var michis: [String] = ["cactus", "D1", "D2", "P1", "Ac"]
    
    var indice: Int = 0
    
    
    @IBOutlet weak var imagenCactus: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagenCactus.image = UIImage(named: michis[indice])
            
    }
    @IBAction func move(_ sender: UIButton){
        if sender.tag == 0{
            indice -= 1
            if indice < 0{
                indice = michis.count - 1
            }
        }else{
            indice += 1
            if indice > 4{
                indice = 0
            }
        }
        imagenCactus.image = UIImage(named:michis[indice])
    }
}

