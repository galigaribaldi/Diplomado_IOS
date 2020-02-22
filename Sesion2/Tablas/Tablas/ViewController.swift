//
//  ViewController.swift
//  Tablas
//
//  Created by Hernán Galileo Cabrera Garibaldi on 22/02/20.
//  Copyright © 2020 galios. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    var nombre: [String] = ["Luis", "Miguel", "Isa", ":v", ">:v"]
    
    var carrito: [String] = []
    
    @IBOutlet weak var tablita: UITableView!
    @IBOutlet weak var boton: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nombre.count
    }
    //MEtodo Sobrecargado
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //De las celdas que estan encoladas, utiliza uno
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        cell.textLabel?.text = nombre[indexPath.row]
        if indexPath.row % 2 == 0{
            cell.backgroundColor = .blue
        }else{
            cell.backgroundColor = .green
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailView = segue.destination as! DetailViewController
        
        let myIndexPath = tablita.indexPathForSelectedRow
        detailView.item = nombre[myIndexPath!.row]
        detailView.vc = self
    }
    func refresh(){
        print(carrito)
        boton.text = String(carrito.count)
    }
    
}

