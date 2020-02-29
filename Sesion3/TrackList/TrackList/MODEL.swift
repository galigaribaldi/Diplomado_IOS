//
//  MODEL.swift
//  TrackList
//
//  Created by Hernán Galileo Cabrera Garibaldi on 28/02/20.
//  Copyright © 2020 galios. All rights reserved.
//

import UIKit

struct ResultSearch: Codable{
    var resultsCount: Int
    var results:[Track]
}

struct Track: Codable{
    var artistName: String
    var trackName: String
}
