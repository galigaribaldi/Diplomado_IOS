//
//  TrackCell.swift
//  clase5TableItunes
//
//  Created by Hernán Galileo Cabrera Garibaldi on 29/02/20.
//  Copyright © 2020 Daniel Mayo. All rights reserved.
//

import UIKit

class TrackCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var portada: UIImageView!
    
    var track: Track!{
        
        didSet{
            title.text = track.trackName
            guard let url = URL(string: track.artworkUrl100 ?? "") else { return }
            URLSession.shared.dataTask(with: url) {(data, response, error) in  print("Descargando la imagen", data)
            guard let dataImage = data else {return}
                DispatchQueue.main.async {
                    self.portada.image = UIImage(data: dataImage)
                }
            }.resume()
        }

    }
}
