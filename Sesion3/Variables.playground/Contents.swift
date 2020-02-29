import UIKit

/// Direccion de variables
// Variable calculada
//Closer para la variable
/*
let timed: Bool = {
    if val == 1{
        return true
    }else{
        return false
    }
}()
*/
let boton: UIButton = {
    let b = UIButton(type: .system)
    b.setTitle("Click on me", for: .normal)
    return b
}()

var now: String{
    get{
        return Date().description
    }
    set{
        print(newValue)
    }
}
print(now)
now  = "Today"
print(now)

//Setters observadores
var cualquierCosa = "cualquericosa"{
    willSet{
        print(newValue)
    }
    didSet{
        print(oldValue)
    }
}
print(cualquierCosa)
