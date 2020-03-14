//
//  ProfileViewController.swift
//  ProyFirebase
//
//  Created by Hernán Galileo Cabrera Garibaldi on 13/03/20.
//  Copyright © 2020 galios. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseFirestore
import MobileCoreServices
import FirebaseUI

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var userID: String!
    var getRef: Firestore!
    
    var optimizedImage: Data!
    
    @IBOutlet weak var ProfileImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .red
        
        getRef = Firestore.firestore()
        
        Auth.auth().addStateDidChangeListener{ (auth, user) in
            self.userID = user?.uid
            print(self.userID)
            if user == nil{
                print("Usuario No Logeado")
            } else{
                self.userID = user?.uid
                print(self.userID)
                self.emailLabel.text = user?.email
                self.getName()
                //self.nameLabel.text = user?.las
            }
            
        }
 
    }
    
    func getPhoto(){
        let storageReference = Storage.storage().reference() // Abre conexion
         let placeHolder = UIImage(named: "Wii") //portaretratos de UIImage con el nombre de la imagen
         
         let userImageRef = storageReference.child("/photos").child(userID)
         userImageRef.downloadURL { (url, error) in
             if let error = error{
                 print(error.localizedDescription)
             }else{
                 print("Imagen Adecuada")
             }
         }
         ProfileImage.sd_setImage(with: userImageRef, placeholderImage: placeHolder)
    }
    
    func getName(){
        var res = getRef.collection("users").document(userID)
        res.getDocument{ (snapshot, error) in
            print("Documento: ", snapshot?.documentID)
            let lastname = snapshot?.get("lastname") as! String ?? "Sin valior"
            print("Documento: ", lastname)
            let name = snapshot?.get("name") as! String ?? "Sin valior"
            self.nameLabel.text = "\(name) \(lastname)"
        }
    }
    @IBAction func uploadPhoto(_ sender: Any) {
        let photoImage = UIImagePickerController()
        photoImage.sourceType = UIImagePickerController.SourceType.photoLibrary
        photoImage.mediaTypes = [kUTTypeImage as String]
        photoImage.delegate = self
        present(photoImage, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
            let optimizedImageData = imageSelected.jpegData(compressionQuality: 0.6){
            ProfileImage.image = imageSelected
            self.saveImage(optimizedImageData)
        }
        dismiss(animated: true, completion: nil)
    }
    func saveImage(_ imageData: Data){
        let activityIndicator = UIActivityIndicatorView.init(style: .large)
        activityIndicator.color = .red
        activityIndicator.center = self.ProfileImage.center
        activityIndicator.startAnimating()
        ProfileImage.addSubview(activityIndicator)
        
        let storageReference = Storage.storage().reference()
        let userImageRef = storageReference.child("/photos").child(userID)
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
