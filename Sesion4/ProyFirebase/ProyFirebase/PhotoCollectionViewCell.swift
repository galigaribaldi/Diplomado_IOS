//
//  PhotoCollectionViewCell.swift
//  ProyFirebase
//
//  Created by Hernán Galileo Cabrera Garibaldi on 14/03/20.
//  Copyright © 2020 galios. All rights reserved.
//

///Forma Programatica

import UIKit

private let reuseIdentifier = "Cell"

class PhotoCollectionViewCell: UICollectionViewCell {
    var photoView: UIImageView = {
        let pv = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        return pv
    }()
    // Equivalente a la utilieria de Command + Shft + L
    override init(frame: CGRect){
        super.init(frame: frame)
        print("pintando")
        // 
        addSubview(photoView)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
