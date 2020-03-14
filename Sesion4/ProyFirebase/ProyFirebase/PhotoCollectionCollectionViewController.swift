//
//  PhotoCollectionCollectionViewController.swift
//  ProyFirebase
//
//  Created by Hernán Galileo Cabrera Garibaldi on 13/03/20.
//  Copyright © 2020 galios. All rights reserved.
//

import UIKit

private let reuseIdentifier = "celda"

class PhotoCollectionCollectionViewController: UICollectionViewController {
    
    var urlList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        //collectionView.collectionViewLayout = self
        
        collectionView.delegate = self
        getPhotos()
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return urlList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> PhotoCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
        
        
        let url = urlList[indexPath.item]
        let urlPhoto = URL(string: url)
        
        //cell.backgroundColor = .blue
        cell.photoView.image = UIImage(named: "Wii")
        
        URLSession.shared.dataTask(with: urlPhoto!) { (data, _, _) in
            guard let data = data else{
                cell.photoView.image = UIImage(named: "Wii")
                return
            }
            DispatchQueue.main.async {
                cell.photoView.image = UIImage(data: data)
            }
        }.resume()
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        //let detailView = DetailPhotoViewController()
        //navigationController?.pushViewController(detailView, animated: true)
        //present(detailView, animated: true)
        let cell = collectionView.cellForItem(at: indexPath) as! PhotoCollectionViewCell
        
        let detailView = DetailPhotoViewController()
        detailView.imagen = cell.photoView.image
        navigationController?.pushViewController(detailView, animated: true)
    }

    func getPhotos(){
        let urlFlickr = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=f5f95f453e6441b3a8455b8cd2b4210c&tags=pink%20floyd&format=json&nojsoncallback=1"
        
        let url = URL(string: urlFlickr)
        
        let jsondecoder = JSONDecoder()
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            
            if let data = data, let results = try? jsondecoder.decode(ResultSeach.self, from: data){
                let photos = results.photos.photo
                var temp:[String] = []
                for photo in photos{
                    let url = "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret)_b.jpg"
                    temp.append(url)
                }
                self.urlList = temp
                DispatchQueue.main.async{
                    self.collectionView.reloadData()
                }
            }
        }.resume()
    }

}

//Extender la funcionalidad sin reescribir lel codigo de arriba y ahcer que no se ea tan revuleto
extension PhotoCollectionCollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
}
