# Prolog: clase polinomio

El proyecto consiste en reescribir una clase polinomio hecha en Java usando Prolog como lenguaje de programación. Se debe mantener la funcionalidad de la clase original en Java. Por lo tanto, se debe poder hacer operaciones sobre polinomios tales como sumar, multiplicar, obtener su grado, entre otros. Además, debe incluir un código que pruebe la funcionalidad del programa que use los mismos polinomios y ejemplos del programa en Java.

## Tabla de contenidos

* [Representación de polinomios](#representación-de-polinomios)
* [Operaciones con polinomios](#operaciones-con-polinomios)
  * [Longitud](#longitud)
  * [Suma y resta](#suma-y-resta)
  * [Multiplicación](#multiplicación)
  * [Derivada](#derivada)
  * [Composición](#composición)
  * [Evaluación](#evaluación)
  * [Impresión](#impresión)

## Representación de polinomios

En este proyecto, los polinomios se representan usando listas. Una lista en Prolog se representa de la siguiente manera:   
`[Elemento1, Elemento2, ...]`.

Para crear tu polinomio utiliza una lista cuyos elementos sean los coeficientes que lo conforman. Estos coeficientes deben acomodarse de manera ascendente, es decir, se inicia con el coeficiente con exponente cero hasta el coeficiente con exponente mayor. Por ejemplo:    
*  5x^3 + 4x + 11   ->  `[11, 4, 0, 5]`
*  -3x^2 + 9x - 1   ->  `[-1, 9, -3]`

Se deben expresar los polinomios de esta manera para posteriormente realizar operaciones sobre ellos.

## Operaciones con polinomios

Una vez que sabemos como representar nuestros polinomios, debemos elegir que operación deseamos realizar sobre ellos. 

A continuación, se detallan las posibles operaciones a realizar sobre ellos.

### Longitud

### Suma y resta

Para realizar la suma o resta entres dos polinomios se debe realizar una consulta en la cual se especifíquen dos polinomios que serán sumados o restados. El resultado de la operación se guardará en una variable declarada por el usuario. Las reglas que realizan estas operaciones son las siguientes:
* `polySum(Ms, Ns, Ss)`
* `polyMin(Ms, Ns, Ss)`

Los primeros dos argumentos representan los polinomios sobre los cuales se realizará la operación. El tercer argumento debe ser una variable que guarde el resultado devuelto. Por ejemplo, si tenemos dos polinomios A = {5x^2 - 3x + 2} y B = {x^3 - 2x^2 + 7x -11}, A + B y A - B se realiza de la siguiente manera:



### Multiplicación

### Derivada

### Composición

### Evaluación

### Impresión
