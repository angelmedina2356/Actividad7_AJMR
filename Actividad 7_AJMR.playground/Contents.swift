import UIKit
/*:
# Playground - Actividad 7
* Valor por tipo y por referencia
* Funciones personalizadas Y Genericos
* Funciones de la biblioteca Swift para Arreglos
*/


/*: 
### Valor por tipo y por referencia
A) Para la colección "var costo_referencia:[Float] = [8.3,10.5,9.9]", aplicar el impuesto del 16% a través de recorrer la colección "costo_referencia" para aplicar el impuesto a cada cantidad, crear una función Impuesto que recibe como parámetro la colección y regrese aplicado el impuesto a cada cantidad.
*/
var costo_referencia:[Float] = [8.3,10.5,9.9]
var indice:Int = 0
for i in costo_referencia {
    costo_referencia[indice] = i*0.16
    indice += 1
}
costo_referencia
func iva(arreeglo:[Float]) -> [Float]{
    var res:[Float] = []
    for i in arreeglo {
        res.append(i*0.16)
    }
    return res
}
iva(arreeglo: costo_referencia)
costo_referencia
//: B) Crear la función "sumaTres"  que reciba una función con dos valores a sumar y un segundo parametro para sumar el tercer número.
let sumar = {(s:Int, d:Int) -> Int in return s+d}
sumar (100, 200)

func sumthree(q:Int, w:Int, e:Int) -> Int { return sumar (q, w) + e}
sumthree(q: 20, w: 500, e: 100)





/*:
### Funciones personalizadas y Genéricos

 
 A) Generics: Crear la función genérica para intercambiar valores entre dos variables del mismo tipo.
*/
func intera(a:inout String, b:inout String) -> (String, String){
    let temp = a
    a = b
    b = temp
    return (a,b)
}
func interb(a:inout Double, b:inout Double) -> (Double, Double){
    let temp = a
    a = b
    b = temp
    return (a,b)
}


//: B) Función personalizada: Crear la función "Transformar" que reciba como parámetro una colección de tipo Int  "var datos = [3,7,9,2]" y una función que transforme cada valor de la coleción en una operación definida fuera de la función, regresando una colección transformada.
extension Array{
    func trsnsfomar<t>(initial:t, acumula:(t,Element) -> t) -> t {
        var res:t = initial
        for value in self {
            res = acumula(res, value)
        }
        return res
    }
}
var data = [3, 7, 9, 2]
var letter = ["q", "w", "e", "r"]
data.trsnsfomar(initial: 0) {(q,w) in q + w}
letter.trsnsfomar(initial: "") {(q,w) in q + w}
/*:
### Biblioteca de Swift
A) Aplicar la función de librería de Swift "map" para la colección var precios = [4.2, 5.3, 8.2, 4.5] y aplicar el impuesto de 16% y asignarla a la variable "impuesto"
*/
var precios = [4.2, 5.3, 8.2, 4.5]
var impuesto = precios.map{a in return a * 0.16 + a}
impuesto
//: B) Aplicar la función de la librería de Swift "filter" para la colección resultante "impuesto" del paso A, en donde se obtengas solo los precios mayores a 6.0 y asignarlos a la variable "precio_menor"
var menorprice = precios.filter{a in a > 6.0}
menorprice




