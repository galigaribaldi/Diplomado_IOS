import UIKit

struct User: Codable{
    var first_name: String
    var last_name: String
    var country: String
}

var str = "Hello, playground"

let path = Bundle.main.path(forResource: "datos", ofType: "json")

let jsonData = NSData(contentsOfFile: path!)

let user = try! JSONDecoder().decode(User.self, from: jsonData! as Data)

print(user.last_name)
