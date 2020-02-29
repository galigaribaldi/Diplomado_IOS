//
//  Model.swift
//  clase5TableItunes
//
//  Created by Daniel Mayo on 28/02/20.
//  Copyright © 2020 Daniel Mayo. All rights reserved.
//

import UIKit

struct ResultSearch:Codable{
    var resultCount : Int
    var results:[Track]
}

struct Track: Codable{
    var artistName : String
    var trackName : String
    var artworkUrl100: String
    
}



