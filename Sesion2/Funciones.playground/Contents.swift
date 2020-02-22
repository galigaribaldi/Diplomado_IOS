import UIKit

//funciones

func suma(){
    print("Sumando") //Las funciones todas o no regresan tuplas no tiene metodos ni propiedades
}

//let res = suma()
//firma de la funciòn anterior **()**

func multiplica(x: Int, y: Int){
    print("Multiplicacion: ", x * y)
}
//LA firma es (Int, Int)
multiplica(x: 3, y: 8)

func divide(_ x: Int,entre y: Int){
    print("Division: ", x / y)
}
divide(8, entre: 2)

func resta(_ x: Int, menos y: Int)-> Int{ //Esconder el parametro de la funcion
    return x - y
}

let resultado = resta(10, menos:2)

var contador = 0
/*
func incrementa(valor: Int){
    valor += 1
} De esta forma no te deja por que el estas mandando el valor
incrementa(valor: contador)
 */
func incrementa(valor: inout Int){
    valor += 1
}
//mandas la referencia en lugar del valor de la variable

incrementa(valor: &contador)

//overloading: Reescritura o sobrecarga de funciones

func say(_ palabra: String){
    print(palabra)
}

func say(_ palabra: Int){
    print(palabra)
}
say(3)
say("hola")

func niega()-> String{
    return "No"
}

func niega()-> Int{
    return 0
}

//let valorNegado = niega() //El cpompilador lo entiende como una reescritura, el asutno no es lo que regresas, si no lo que metes
//Existe una ambiguedad para el compìlador
// La ambiguedad es la forma en la que la invocas, no la forma de escritura

////PARAMETROS POR DEFAULT

func creaTarjeta(nombre: String, saldo: Double = 0.0){
    print("Creando tarjeta para: \(nombre) con saldo de: \(saldo)")
}
creaTarjeta(nombre: "German")

//FUNCIONES CON MUCHOS PARAMETROS
func imprimeCadenas(_ cadenas: String ...){
    for cadena in cadenas{
        print(cadena)
    }
}
imprimeCadenas("hola", "Que", "Tal")
// Funciones con parametros

func ejecuta(a: Int, b:Int, funcion: (Int, Int)->Int)-> Int{
        let resultado = funcion(a,b)
        return resultado
    }
let resultadoFinal = ejecuta(a: 8, b: 10, funcion: resta)
