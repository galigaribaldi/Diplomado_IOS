import UIKit

class Alumno{
    var nombre: String
    init(nombre:  String){
        self.nombre = nombre
    }
}

let fer = Alumno(nombre: "Fer")
print("Objeto 1: ", fer.nombre)

//Creando un nuevo objeto
/*let juan = fer
print("Nuevo objeto: ", juan.nombre)
juan.nombre = "Juan"
print("Nuevo objeto modificado: ", juan.nombre)
//Tipo de dato por referencia
print("Objeto fer modificado:", fer.nombre)
*/
//Creando un nuevo objeto
let juan = Alumno(nombre: "Juan")
print("Objeto 2: ", juan.nombre)

//Tipo de dato por valor
struct Profesor{
    //Constructores sinteticos
    var nombre: String
}

//instancia de structura
var mary = Profesor(nombre: "Mary")

//Copia de contenido de julio a mary (No direccion)
var julio = mary

print("Estructura Julio: ", julio.nombre)
julio.nombre = "Julio"
print("Estructura Julio(Cambiado): ", julio.nombre)
print("Estructura Mary: ", mary.nombre)

//Metodos y propiedades de Clases
//Nulo = nil y no se debe de pon er una variable en nulo
class Mascota{
    var nombre: String
    //var ☠️ = "Calavera"
    
    init(nombre: String){ //MEtodo constructor, darle un valor
        self.nombre = nombre
    }
    
    func actividad(tipo: String){
        print("\(nombre) realiza \(tipo)")
    }
}

let michi = Mascota(nombre: "michi") //instancia de la clase
michi.actividad(tipo: "El buen dormir")

struct Owner{
    var name: String
    var age: Int
    
    mutating func actividad(){ //Metodos que midifican una de las variable
        self.age = self.age + 1
        print("\(name) tiene \(age) años")
    }
}

var luis = Owner(name: "Luis", age: 20)
luis.actividad()
