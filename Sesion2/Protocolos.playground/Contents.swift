import UIKit

protocol Volador{
    func volar() //Funcion sin implementaciòn se le llama enumerar o definir la funcion
}
struct Ave: Volador{
    func volar() {
        print("Volar")
    }
}

class Humano: Volador{
    func volar() {
        print("humano Volador")
    }
}

struct Perro{
    
}

func hazloVolar(_ filtro: Volador){
    filtro.volar()
}
//Isntancia
let cotorro = Ave()
let cesar = Humano()
let firulais = Perro()

hazloVolar(cotorro)
hazloVolar(cesar)
//hazloVolar(firulais) //Los protocolos solo son adminsibles a los metodos o funciones que se definen en su estructura
