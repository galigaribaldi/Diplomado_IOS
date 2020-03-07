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
let url = URL(string: "https://itunes.apple.com/search?term=pink%20floyd")
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

var str = "Hello, playground"
