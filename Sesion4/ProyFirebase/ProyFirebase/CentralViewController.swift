//
//  CentralViewController.swift
//  ProyFirebase
//
//  Created by Hernán Galileo Cabrera Garibaldi on 13/03/20.
//  Copyright © 2020 galios. All rights reserved.
//

import UIKit
class CentralViewController: UITabBarController{ //Barra blanca que aparece abajo
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        tabBar.tintColor = .blue
        
        let ProfileController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ProfileViewController") as? ProfileViewController
        
        ProfileController!.tabBarItem.title = "Perfil"
        ProfileController!.tabBarItem.image = UIImage(systemName: "person.fill")
        
        let PhotosController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PhotoCollectionViewController") as? PhotoCollectionCollectionViewController
        
        PhotosController!.tabBarItem.title = "Fotos"
        PhotosController!.tabBarItem.image = UIImage(systemName: "doc.richtext")
        
        let SaveController = UINavigationController(rootViewController: ProfileViewController())
        SaveController.tabBarItem.title = "Favoritos"
        SaveController.tabBarItem.image = UIImage(systemName: "tray.and.arrow.down.fill")
        viewControllers = [
            ProfileController!,
            PhotosController!,
            SaveController
        ]
    }
}
