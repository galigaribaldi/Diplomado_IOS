//
//  SecondViewController.swift
//  ComunicateViews
//
//  Created by Hernán Galileo Cabrera Garibaldi on 06/03/20.
//  Copyright © 2020 galios. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegete{
    func showData(_ name: String)
}


class SecondViewController: ViewController {
    var delegate: SecondViewControllerDelegete?
    
    @IBOutlet weak var nameTF: UITextField!
    
    var testButton: UIButton = {
        var b = UIButton(type: .system)
        b.setTitle("Haz Click", for: .normal)
        b.backgroundColor = .red
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        view.addSubview(testButton)
        testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        testButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @IBAction func saveName(_ sender: UIButton){
        if let name = nameTF.text{
            delegate?.showData(name)
            dismiss(animated: true, completion: nil)
        }
    }

}
