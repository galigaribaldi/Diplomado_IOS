//
//  DetailPhotoViewController.swift
//  ProyFirebase
//
//  Created by Hernán Galileo Cabrera Garibaldi on 14/03/20.
//  Copyright © 2020 galios. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseUI
class DetailPhotoViewController: UIViewController{
    //let width: Int = 0
    var imagen: UIImage! = nil
    var selector: UIImage! = nil
    var userID: String!
    let photoView: UIImageView = {
        let pv = UIImageView(frame: CGRect(x: 8, y: 8, width: 300, height: 300))
        return pv
    }()
    
    ////
    
    let favoriteView: UIImageView = {
        let pf = UIImageView(frame: CGRect(x: 8, y: 10, width: 300, height: 300))
        return pf
    }()

    
    let saveButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("Descargar imagen", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(savePhoto), for: .touchUpInside)
        return b
    }()
    
    ////
    let favoriteButton: UIButton = {
        let f = UIButton(type: .system)
        f.setTitle("Agregar a favoritos", for: .normal)
        f.translatesAutoresizingMaskIntoConstraints = false
        f.addTarget(self, action: #selector(agregarF), for: .touchUpInside)
        return f
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ////
        //favoriteView.image = selector
        view.addSubview(favoriteButton)
        ////
        photoView.image = imagen
        view.addSubview(photoView)
        view.addSubview(saveButton)
        photoView.center = view.center
        saveButton.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 10).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //
        favoriteButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 10).isActive = true
        favoriteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        //Obtener el ID del usuario
        Auth.auth().addStateDidChangeListener{ (auth, user) in
            self.userID = user?.uid
            print(self.userID)
            if user == nil{
                print("Usuario No Logeado")
            } else{
                self.userID = user?.uid
                print(self.userID)

                //self.nameLabel.text = user?.las
            }
        }
    }
    
    //////
    func saveFavorite(_ imageData: Data){
        
        let storageReference = Storage.storage().reference()
        let userImageRef = storageReference.child("/sub").child(userID)
        let uploadMetadata = StorageMetadata()
        uploadMetadata.contentType = "image/jpeg"
        userImageRef.putData(imageData, metadata: uploadMetadata) { (StorageMetadata, error) in
            if let error = error{
                print("Error: ", error.localizedDescription)
            }else{
                print(StorageMetadata?.path)
            }
        }
    }
    /////
    
    @objc func savePhoto(){
        print("Sav save :v ")
        guard let image = photoView.image else { return }
        //Acceder a al galeria (permisos)
        UIImageWriteToSavedPhotosAlbum(imagen, nil, #selector(newImage(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc func newImage(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer){
            print(":v 2")
    }
    @objc func agregarF(){
        print("Favoritos")
        guard let favorit = photoView.image else { return }
                let optimizedImageData = favorit.jpegData(compressionQuality: 0.6)
                self.saveImage(optimizedImageData!)
    }
        
        func saveImage(_ imageData: Data){
            let storageReference = Storage.storage().reference()
            let userImageRef = storageReference.child("/photos").child(userID).child(UUID().uuidString) //
            let uploadMetadata = StorageMetadata()
            uploadMetadata.contentType = "image/jpeg"
            userImageRef.putData(imageData, metadata: uploadMetadata) { (StorageMetadata, error) in
                if let error = error{
                    print("Error: ", error.localizedDescription)
                }else{
                    print(StorageMetadata?.path)
                }
            }
        }
        
}

