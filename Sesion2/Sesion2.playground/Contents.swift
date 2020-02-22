import UIKit

//Optionals: Es una variables que etsa facilitada para recibir valores nulos
var nombre: String? //Para cambiarle los valores
//nombre = nil
//print(nombre!)

// Optional binding
nombre = "Jerrys"
if let nombreBackup = nombre{
    print("El nombre es: ", nombreBackup)
}else{
    print("No hay nombre")
}

//Nial Coalescente
let nombreRespaldo = nombre ?? "don nadie"

//Guard Binding
func saluda(cadena: String?){
    guard let temp = cadena else{
        print("No hay valor")
        return
    }
    print("Si hay un valor ", temp)
}

saluda(cadena: "Hola")
