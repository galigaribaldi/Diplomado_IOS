import UIKit

//Closures

//Funciones anonimas

let miClosure = {(number: Int) -> Int in
    let resultado = number * number
    return resultado
}

var listaNumeros = [2,3,4,5,6,7]
var numerosMapeados = listaNumeros.map(miClosure) //MApear y reciba cada una de ellas, entrar e ir multiplicando cada una de ellas
print(numerosMapeados)

numerosMapeados = listaNumeros.map({(number: Int)-> Int in
    let resultado = number * number
    return resultado
})
numerosMapeados = listaNumeros.map({number in number * number})
numerosMapeados = listaNumeros.map{number in number * number}
numerosMapeados = listaNumeros.map{$0 * $0}
