//
//  DetailViewController.swift
//  Tablas
//
//  Created by Hernán Galileo Cabrera Garibaldi on 22/02/20.
//  Copyright © 2020 galios. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var item: String = ""
    var vc: ViewController?
    
    @IBOutlet weak var productName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productName.text = item
        //print(vc!.nombres)
    }
    @IBAction func agregar(_ sender: UIButton){
        vc!.carrito.append(item)
        vc!.refresh()
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func cancelar(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }

}
