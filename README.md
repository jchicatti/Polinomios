# Prolog: clase polinomio

El siguiente código de Prolog es bastante inusual. Prolog pertenece a la familia de lenguajes de programación lógico interpretado, mientras que Java es el lenguaje orientado a objetos por excelencia.

Este proyecto consiste en replicar a una clase de objetos tipo Polinomio hecha en Java usando Prolog como lenguaje de programación. Se debe mantener la funcionalidad de la clase Java original. Por lo tanto, se debe poder hacer operaciones sobre polinomios tales como sumar, multiplicar, evaluar, entre otros. Esto es especialmente difícil en Prolog. Además, debe incluir un código que pruebe la funcionalidad del programa. Los polinomios y ejemplos a probar deben ser iguales a los del programa dado en Java.

En Prolog no existen las funciones, solo las reglas. Para facilitar la comprensión del documento se considerarán como lo mismo.

## Tabla de contenidos

* [Representación de polinomios](#representación-de-polinomios)
* [Operaciones con polinomios](#operaciones-con-polinomios)
  * [Suma y resta](#suma-y-resta)
  * [Multiplicación](#multiplicación)
  * [Derivada](#derivada)
  * [Composición](#composición)
  * [Evaluación](#evaluación)

## Representación de polinomios

En este proyecto, los polinomios se representan usando listas. Una lista en Prolog se representa de la siguiente manera:   
`[Elemento1, Elemento2, ...]`.

Para crear tu polinomio utiliza una lista cuyos elementos sean los coeficientes que lo conforman. Estos coeficientes deben acomodarse de manera ascendente, es decir, se inicia con el coeficiente con exponente cero hasta el coeficiente con exponente mayor. Por ejemplo:    
*  y<sub>1</sub>(x) = 5x<sup>3</sup> + 4x + 11 &nbsp;&nbsp;&nbsp; se escribe como `Y1 = [11, 4, 0, 5]`
*  y<sub>2</sub>(x) = -3x<sup>2</sup> + 9x - 1 &nbsp;&nbsp;&nbsp;&nbsp; se escribe como `Y2 = [-1, 9, -3]`

Se deben expresar los polinomios de esta manera para posteriormente realizar operaciones sobre ellos.

## Cómo hacer consultas

Una vez que sabemos como representar nuestros polinomios, debemos elegir que operación deseamos realizar sobre ellos. Para aprovechar la funcionalidad del proyecto, es necesario realizar **consultas**. Mediante estas consultas podremos llamar a nuestras distintas funciones para manejar polinomios.

La terminal de Prolog recibe una consulta después de `?-` y cada una de ellas debe terminar con un punto.

Para poder empezar a usar el programa en Prolog siga el siguiente diagrama:



## Operaciones con polinomios

A continuación, se detalla cada posible operacion a realizar sobre polinomios.

### Suma y resta

Para realizar la suma o resta entres dos polinomios se debe hacer una consulta en la cual se especifíquen dos polinomios que serán sumados o restados. El resultado de la operación se guardará en una variable declarada por el usuario. Las reglas que realizan estas operaciones son las siguientes:
* `polySum(Ms, Ns, Ss)` (suma)
* `polyMin(Ms, Ns, Ss)` (resta)

Los primeros dos argumentos representan los polinomios sobre los cuales se realizará la operación. El tercer argumento debe ser una variable que guarde el resultado devuelto. Por ejemplo, si tenemos dos polinomios A(x) = 4x<sup>3</sup> + 3x<sup>2</sup> + 1 y B(x) = 3x<sup>2</sup> + 5, podemos ejemplificar ambas operaciones: A + B, A - B.

La consulta realizada y el resultado de ambas operaciones se muestra sobre la terminal de SWI-Prolog.

![sumaresta](https://user-images.githubusercontent.com/70402438/158848268-8169fdeb-c847-45bc-adf7-7ecba6bde642.png)

### Multiplicación



![mult](https://user-images.githubusercontent.com/70402438/158851889-74ebc5bf-81b4-43c0-b6e0-e1cdeff5f345.png)

### Derivada

![dif](https://user-images.githubusercontent.com/70402438/158851924-e37307e2-791d-44e7-80e0-f2eba92fca65.png)

### Composición

La composición se usa cuando se busca remplazar una variable dentro de un polinomio con otro. En otras palabras, si tenemos un polinomio con variable x, buscamos reemplazar todas esas 'x' por otro polinomio. Si tenemos Y(x) = x + 1 y Z(x) = x + 12, entonces Y(Z) = (x + 12) + 1. 

Por ejemplo, si seguimos usando A(x) = 4x<sup>3</sup> + 3x<sup>2</sup> + 1 y B(x) = 3x<sup>2</sup> + 5. Es posible realizar A(B):

![comp](https://user-images.githubusercontent.com/70402438/158851959-db217856-de7a-4a8a-8a85-668e12a00bf2.png)

### Evaluación

La evaluación consiste en obtener el valor del polinomio cuando nuestra variable, en este caso x, se va reemplazada por un valor numérico. Se utiliza la regla `polyEval(C,Ms,V,Ss)`. El primer argumento (C) siempre es cero, ya que es el exponente al que se eleva el término actual. Recibe en Ms el polinomio a evaluar y en V el valor a usar. El resultado se guarda en Ss.

Por ejemplo, podemos evaluar A(x) = 4x<sup>3</sup> + 3x<sup>2</sup> + 1 con 12, es decir A(12):

![eval](https://user-images.githubusercontent.com/70402438/158851994-36e5635c-6b21-4872-8450-ae431067e2a9.png)


