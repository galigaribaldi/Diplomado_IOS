import UIKit
import PlaygroundSupport

struct ResultSearch: Codable{
    var resultsCount: Int
    var results:[Track]
}

struct Track: Codable{
    var artistName: String
}
//Hacer una solicitud a una peticion e inyectar los datos
let url = URL(string: "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=f5f95f453e6441b3a8455b8cd2b4210c&tags=mexico&format=json&nojsoncallback=1")
//let url = URL(string: "https://www.unam.mx")
let jsonDecoder = JSONDecoder()

let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
    if error != nil{
        print(error?.localizedDescription)
    }
    
    if let data = data, let tracks = try? jsonDecoder.decode(ResultSearch.self, from: data){
        for track in tracks.results{
            print(track.artistName)
        }
    }
}

task.resume()
PlaygroundPage.current.needsIndefiniteExecution = true
//Hola
