import UIKit // User Interface Kit

var str = "Hello, playground"
///Tipado estricto
let edad = 22 //
// String, int, double, float bool
var respuesta: String = "Correcto" //
//let jose: Alumno = "Jose" Tipo de dato
// Struct=Valor(Copia), class=Referencia(original), Enum

// Class = Cuando es necesario Herencia, Heap

// Struct = Mas rápido, stack

class Coche{ //Tipo de dato por referencia
    var marca: String
    
    init(marca: String){
        self.marca = marca
    }
}

struct Animal{
    var nombre: String
}

// Clases van con let
let vocho = Coche(marca: "vw")
var michi = Animal(nombre: "michi")

// weak, strong, unowned
