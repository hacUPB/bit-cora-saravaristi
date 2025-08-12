## 1. Escribe un programa en lenguaje ensamblador que sume los primeros 100 números naturales. 

```
@1
D=A 
@i
D=M 
@0
D=A
@sum
M=D 
(LOOP)
@i
D=M 
@100
D=D-A 
@END
D;JGT
@sum
D=M 
@i 
M=M+1
@LOOP
0;JMP
(END)
@END
0;JMP

``` 
Este reto se me complico un poco ya que no tenia muy claros los conceptos de variables y etiquetas que eran fundamentales para resover este ejercicio por lo que tuve que volver a estudiar los temas y pedirle al profesor que me aclarara algunas dudas, pero luego de eso a pesar de algunos errores logre comprender el enunciado y el codigo dado para traducirlo en hack

### ¿Cómo están implementadas las variables `i` y `sum`? 

Como i y sum son varibales se deben de implementar usando etiquetas que luego el propio programa traduce como direcciones numericas de la RAM

### ¿En qué direcciones de memoria están estas variables? 

En este caso la variable @i esta ubicada en RAM[16] y @sum en RAM[17] ya que el ensamblador le asigna a la primera variable la dirección 16 y continua hacia arriba es decir 16, 17, 18, etc..

### ¿Cómo está implementado el ciclo `while`? 

El ciclo while se implementa usando etiquetas que en este caso es (LOOP) donde se hace la comparación (i <= 100) donde si se cumple 

### ¿Cómo se implementa la variable `i`?

Se debe se sumar 1 a i hasta que llegue a 100 y al llegar a este valor el programa hace un salto (0;JMP) y vuele al inicio si la condición sigue siendo verdadera

### ¿En qué parte de la memoria se almacena la variable `i`? 

Se almacena especificamente en RAM [16]

## Después de todo lo que has hecho, ¿Qué es entonces una variable? 

Una varible es una posición de a memoria donse se guarda una valor que dentro del programa puede leer o modificiar

## ¿Qué es la dirección de una variable? 

Es el lugar dentro de la memoria RAM en la que se guarda la varable, en este caso @i esta en la dirección 16 de la RAM

### ¿Qué es el contenido de una variable? 

Es el valor que esta almacenado en la celda de memoria escogida por ejempplo si i=1 significa que en RAM [16] esta almacenado el valor 1


## 2.Transforma el programa en alto nivel anterior para que utilice un ciclo for en vez de un ciclo while. 

```
sum = 0;
for (i = 1; i <= 100; i = i + 1) {
    sum = sum + i;
}
```
Para este reto tuve que recordar algunos conceptos de materias vistas en semestres anteriores para recordar el funcionamiento de los ciclos for

## 3.Escribe un programa en lenguaje ensamblador que implemente el programa anterior. 

```
@i
D=M 
@0
D=A
@sum
M=D 
(FOR)
@i
D=M
@100
D=D-A
@END
D;JGT
@i
D=M
@sum
M=M+1
@FOR
0;JMP
(END)
@END
0;JMP

```

Al igual que con el reto 1 este se me complico un poco ya que a pesar de ser el mismo codigo tuve que recordar como funcionaba los ciclos for y como se diferenciabana de los ciclos while para lograr hacer un programa que implementara el ciclo for en vez del ciclo while, pero al tener el codigo del reto 1 como base no fue tan complicado como lo espere

## 4.Ahora vamos a acercarnos al concepto de puntero. Un puntero es una variable que almacena la dirección de memoria de otra variable. Observa el siguiente programa escrito en C++ 

```
int var = 10;
int *punt;
punt = &var;
*punt = 20;
```
Este reto lo logre resolver tras estudiar lo basico sobre punteros, pero a pesar de eso se me complicaron los demas retos ya que necesitaba practica para comprender el tema de mejor forma

### ¿Cómo se declara un puntero en C++? `int *p;`. `p` es una variable que almacenará la dirección de un variable que almacena enteros. 

Para declarar un puntero se debe de especificar el tipo de dato seguido de un asterisco y el nombre del puntero, por ejemplo int *punt;

### ¿Cómo se define un puntero en C++? `p = &a;`. Definir el puntero es inicializar el valor del puntero, es decir, guardar la dirección de una variable. En este caso `p` contendrá la dirección de `a`. 

Un puntero se inicializa asignandole la direccón de memoria de otra variable usando el operador de dirección (&), por ejemplo punt = &var;

### Cómo se almacena en C++ la dirección de memoria de una variable? Con el operador `&`. `p = &a;` 

En vez de usar @ en este caso al ser un puntero se una &, por ejemplo &var

### ¿Cómo se escribe el contenido de la variable a la que apunta un puntero? Con el operador . `p = 20;`. En este caso como `p` contiene la dirección de `a` entonces `p` a la izquierda del igual indica que quieres actualizar el valor de la variable `a`. 

Para modificar el contenido de un puntero se debe de acceder a la direccion de memoria usando el asterisco junto con el puntero para modificar el valor de la variable, por ejemplo *punt =20;

## 5.Traduce este programa a lenguaje ensamblador: 

```
int var = 10;
int *punt;
punt = &var;
*punt = 20;
```

### Traducción 

```
@10
D=A
16
M=D
@16
D=A
@17
D=M
@20
D=A
@17
A=M
M=D
```

Especificiamente este punto se me complico demasiado ya que de verdad no sabia por donde iniciar a la hora de traducir a hack, no tenia muy claro el concepto de puntero y como funcionaba lo que me complico mucho las cosas, me tomo unos cuantos dias traducirlo bien y comprender su funcionalidad, pero al lograrlo no se me hizo tan dificil hacer el siguiente reto

## 6.Ahora vas a usar un puntero para leer la posición de memoria a la que este apunta, es decir, vas a leer por medio del puntero la variable cuya dirección está almacenada el 

```
int var = 10;
int bis = 5;
int *p_var;
p_var = &var;
bis = *p_var;
```
### Traducción 

```
@10
D=A
@var
M=D
@5
D=A
@bis
M=D
@var
D=A
@pvar
M=D
@pvar
A=M
D=M
@bis
M=D
```

Al igual que con el reto anterior tuve problemas a la hora de traducir a hack ya que debia de tener claros los conceptos de puntero y todo lo que conlleva para realizarlo bien

## 7.Traduce este programa a lenguaje ensamblador: 

```
int var = 10;
int bis = 5;
int *p_var;
p_var = &var;
bis = *p_var;
```

### Traducción 

```
@10
D=A
@0
M=D
@5
D=A
@1
M=D
@0
D=A
@2
M=D
@2
A=M
D=M
@1
M=D
```
Al haber realizado los dos retos anteriores este se me hizo mas facil ya que los conceptos ya eran familiares para mi y solo tuve que investigar un poco mas sobre el tema para realizar corrextamente el codigo y evitar errores

## 8.Vas a parar un momento y tratarás de recodar de memoria lo siguiente. Luego verifica con un compañero o con el profesor.

Este punto lo hice mientras investigaba los concpetos basicos sobre punteros por lo que no fue tan complicado ya que estas preguntas no son tan teoricas y junto a la investigación que hice autonomamente junto con las explicaciones del profe durante las clases hicieron que no se me complica responder

### ¿Qué hace esto `int *pvar;`? 

Si no estoy mal este sirve para declarar un puntero de tipo de dato entero el cual puede almacenar la dirección de este entero, pero todavia no se apunta a nada

### ¿Qué hace esto `pvar = var;`? 

Aca se guarda en pvar el valor de var como si esta fuese una dirección de memoria, pero para wue funcione var tiene que ser un puntero

### ¿Qué hace esto `var2 = *pvar`? 

Se lee el valor el valor almacenado en la dirección a la que apunta pvar y se lo asigna a var2 lo cual es desreferenciar el puntero que en este caso es pvar

### ¿Qué hace esto `pvar = &var3`? 

Aca se guarda en pvar la dirección de memoria de var3 lo que hace que pvar apunte a esta variable

## 9.Considera que el punto de entrada del siguiente programa es la función main, es decir, el programa inicia llamando la función main. Vas a proponer una posible traducción a lenguaje ensamblador de la función suma, cómo llamar a suma y cómo regresar a std::cout << "El valor de c es: " << c << std::endl; una vez suma termine. 

```
#include <iostream>

int suma(int a, int b) {
   int var = a + b;
   return var;
}


int main() {
   int c = suma(6, 9);
   std::cout << "El valor de c es: " << c << std::endl;
   return 0;
}
```

### Traducción 

```
@6
D=A
@0
M=D
@9
D=A
@1
M=D
@sum
0;JMP
(RETURN)
@3
D=M
@4
M=D
@4
D=M
@END
0;JMP
(sum)
@0
D=M
@1
D=D+M
@2
M=D
D=M
@3
M=D
@RETURN
0;JMP
(END)
@END
0;JMP
```
Este punto como tal se me complico bastante, ya que habian terminos que no conocia y tuve que investigarlos para poder realizar el codigo, en este caso mi mayor conflicto fue el pasar del codigo inicial a la traducción porque no sabia por donde iniciar para hacer el codigo lo mas facil y logicamente posible
