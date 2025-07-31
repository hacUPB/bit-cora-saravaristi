// 1. Escribe un programa en lenguaje ensamblador que sume los primeros 100 números naturales.
    
//¿Cómo están implementadas las variables `i` y `sum`? 


//¿En qué direcciones de memoria están estas variables? 


//¿Cómo está implementado el ciclo `while`? 


//¿Cómo se implementa la variable `i`? 


//¿En qué parte de la memoria se almacena la variable `i`? 


//Después de todo lo que has hecho, ¿Qué es entonces una variable? 


//¿Qué es la dirección de una variable? 


//¿Qué es el contenido de una variable? 

// 2.Transforma el programa en alto nivel anterior para que utilice un ciclo for en vez de un ciclo while. 

// 3.Escribe un programa en lenguaje ensamblador que implemente el programa anterior. 

// 4.Ahora vamos a acercarnos al concepto de puntero. Un puntero es una variable que almacena la dirección de memoria de otra variable. Observa el siguiente programa escrito en C++ 

// ¿Cómo se declara un puntero en C++? `int *p;`. `p` es una variable que almacenará la dirección de un variable que almacena enteros. 


// ¿Cómo se define un puntero en C++? `p = &a;`. Definir el puntero es inicializar el valor del puntero, es decir, guardar la dirección de una variable. En este caso `p` contendrá la dirección de `a`. 


// ¿Cómo se almacena en C++ la dirección de memoria de una variable? Con el operador `&`. `p = &a;` 


// ¿Cómo se escribe el contenido de la variable a la que apunta un puntero? Con el operador . `p = 20;`. En este caso como `p` contiene la dirección de `a` entonces `p` a la izquierda del igual indica que quieres actualizar el valor de la variable `a`. 

// 5.Traduce este programa a lenguaje ensamblador: 

// 6.Ahora vas a usar un puntero para leer la posición de memoria a la que este apunta, es decir, vas a leer por medio del puntero la variable cuya dirección está almacenada e 

// 7.Traduce este programa a lenguaje ensamblador: 

// 8.Vas a parar un momento y tratarás de recodar de memoria lo siguiente. Luego verifica con un compañero o con el profesor. 

// ¿Qué hace esto `int *pvar;`? 


// ¿Qué hace esto `pvar = var;`? 


// ¿Qué hace esto `var2 = *pvar`? 


// ¿Qué hace esto `pvar = &var3`? 

// 9.Considera que el punto de entrada del siguiente programa es la función main, es decir, el programa inicia llamando la función main. Vas a proponer una posible traducción a lenguaje ensamblador de la función suma, cómo llamar a suma y cómo regresar a std::cout << "El valor de c es: " << c << std::endl; una vez suma termine. 

