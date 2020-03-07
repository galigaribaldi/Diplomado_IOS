//
//  ViewController.swift
//  TextFeedKit
//
//  Created by Hernán Galileo Cabrera Garibaldi on 06/03/20.
//  Copyright © 2020 galios. All rights reserved.
//

import UIKit
import FeedKit
    let url = "https://www.npr.org/rss/podcast.php?id=500005"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let urlFeed = URL(string: url) else{
            print("No es válido")
            return
        }
        let parser = FeedParser(URL: urlFeed)
        parser.parseAsync{( result ) in
            switch result{
            case .success(let feed):
                let item = feed.rssFeed?.items?.first
                if let url = item?.enclosure?.attributes?.url{
                    print("Este es el URL: \(url)")
                }
                else{
                    return
                }
                break
            case .failure(let error):
                print(error)
            }
        }
    }

}

