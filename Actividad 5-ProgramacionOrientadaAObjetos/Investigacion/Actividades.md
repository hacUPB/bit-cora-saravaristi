# Sección 1

## Introducción a los objetos

### ¿Qué representa la clase Particle? 

Esta clase como tal es un molde que tiene en ella los datos de cada particula y que operaciones puede hacer cada particula

### ¿Cómo interactúan sus atributos y métodos? 

Los atributos X y Y son el estado del objeto y los metodos move son el comportamiento de que puede cambiar el estado 

## Explorando la memoria

### ¿Los atributos están almacenados de forma contigua? 

Si, los datos se guardan en orden y estan uno al lado del otro en memoria

### ¿Qué indica el tamaño del objeto sobre su estructura interna? 

El sizeof(Particle) muestra cuantos bytes ocupa cada instancia en memoria 

### ¿Cómo se almacenan los objetos en memoria en C++? Si tengo dos instancias de Particle 

En este caso cada uno es un bloque independiente de memoria y si se llegan a definir como variables locales, el compilador se encarga de ponerlos en pila uno despues del otro, pero no necesariamente juntos, por lo que puede haber espacio de relleno o alineación entre ellos

### ¿Cómo se relacionan sus direcciones de memoria? 

En este caso P1 y P2 estan en direcciones de memoria diferentes y cada una es independiente de la otra 

### ¿Los atributos están contiguos?

Si, estos estan dentro del mismo objeto

## Analisis de memoria 

### ¿Cómo afectan los datos estáticos al tamaño de la instancia? 

En este caso los datos estaticos de una clase no forman parte de las instancias de esa clase por lo que no aumentan el sizeof(Simple) o sizeof(Complex) dependiendo de la clase a la que corresponda, esto se debe a que los datos estaticos se encuentran almacenado en la memoria estatica del programa y los comparten todas las inesttancias

### ¿Qué diferencias hay entre datos estáticos y dinámicos en términos de memoria?

Comenzando con que los datos estaticos son variables globales, su tiempo de ejecución se da durante todo el programa y siempre ocupa la misma dirección de memoria, por otro lado los datos estaticos la memoria se pide y se libera en el tiempo de ejecución (runtime) ademas de que el programador decide cuando reservar new y cuando liberar delete por lo cual la vida del dato depende del programador

### ¿Las variables estáticas ocupan espacio en cada objeto?

Static se guarda en una sola dirección de memoria global y todos los objeto Staticdata comparten la misma s, en el caso de Dinamicdata cada objeto reserva memoria adicional en el heap por lo cual cada objeto ocupa un puntero dentro de del objeto mas la memoria dinamica apuntada por ptr, pero hay que tener en cuenta que cada instancia puede reservar distinta cantidad por lo que el uso de memoria depende del constructor

## Reflexión 

### ¿Qué es un objeto desde la perspectiva de la memoria? 

Visto desde la memoria es un bloque contiguo de bytes que representan una instancia concreta de un tipo de clase 

### ¿Cómo influyen los atributos y métodos en el tamaño y estructura del objeto? 



### Conclusión 



# Sección 2  

## Análisis de la estructura de una clase

### ¿Dónde se almacenan los datos y métodos de una clase en C++ en la memoria? Explica el concepto de vtable y cómo se relaciona con los métodos virtuales

Los datos no estaticos se alamacenan dentro de cada objeto, los datos estaticos se guardan en la memoria estatica del programa y los metodos se guardan en su sección de codigo del programa

## Exploración de metodos virtuales

### ¿Cómo afecta la presencia de métodos virtuales al tamaño del objeto? 

Cuando una clase tiene al menos un metodo virtual, el compilador hace que cada objeto tenga un puntero oculto (vptr) lo cual aumenta el tamaño de la instancia

### ¿Qué papel juegan las vtables en el polimorfismo? 

La vtable es una tabla generada por el compilador que contiene las direcciones de las funciones virtuales de la clase, lo que habilita el polimorfirsmo dinamico haciendo que un Base* pueda llamar al metodo correcto de Derived en el tiempo de ejecución 

### ¿Cómo se implementan los métodos virtuales en C++? Explica el concepto de vtable y cómo se utiliza para resolver llamadas a métodos virtuales.

Para implementar metodos virtuales en C++ se debe de hacer con vtables donde cada metodo tiene su vptr para que este apunte la vtable de la clase real al objeto, para resolver llamadas a metodos virtuales se accede a vptr para llegar a la vtable y ejecutar la acción deseada

## Uso de punteros y referencias  

### Observar si el tamaño de la instancia cambia al usar punteros a funciones 

El tamaño de la instancia si cambia ya que al agregar un puntero como atributo de la clase el puntero se almacena dentro del objeto

### Verificar cómo se almacenan estos punteros 

El puntero functPtr se guarda dentro de la memoria del objeto y este almacena la dirección de la función

### ¿Cuál es la relación entre los punteros a métodos y la vtable? 



### ¿Cómo afectan estos mecanismos al rendimiento del programa? 

Como tal ninguno de los mecanismos afecta de forma importante al programa, el rendimiento solo importa si se llaman demasiadas veces cada metodo que hay en el programa en un bucle infinito

### ¿Qué diferencia hay entre punteros a funciones y punteros a métodos miembro en C++? 

Los punteros a funciones apuntan a funciones estaticas o globales, no necesitaqn un objeto para usarse y su tamaño es 1 dirección de memoria (osea 8 bytes), mientras que un puntero a metodos miembro apunta a una función no estatica y necesita un objeto para invocarse porque depende del this, en cuanto a su tamaño este puede ser mayor que el de un puntero simple 

### ¿Cómo afectan al tamaño de los objetos y al rendimiento? 

En este caso los punteros, los metodos estaticos y los metodos virtuales no causan problemas en el rendimiento del programa por que la mayoria de estos generan llamadas directas y si llegan a ser llamadas indirectas estas pueden ser un poco mas lentas, pero no comprometen el rendimiento del programa

### ¿Dónde residen los datos y métodos de una clase en la memoria? 

Cuando se trata de datos no estaticos estos se guardan dentro de cada objeto ya sea heap o stack, mientras que cuando son datos estaticos tienen una unica copia en la memoria global, los metodos se guardan en una sección del codigo y los metodos virtuales se gestionan con una vtable y un puntero oculto en cada objeto

### ¿Cómo interactúan las diferentes partes en tiempo de ejecución? 

Los objetos serian solo datos que se guardan en memoria, los metodos no se guardan adentro de ni gun objeto entonces a la hora de llamar un metodo el programa tiene que buscar el codigo del metodo que ya esta en otra parte de la memoria, en el caso de las variables estaticas estas tienen una copia en memoria global que todos los objetos comparten y para los metodos virtuales, cada objeto tiene un puntero oculto que indica que metodo se debe de ejecutar

### Conclusión 

Para hacer un buen diseño de sistema hay que tener en cuenta el tamaño de los objetos por si se necesitan muchas instancias es mejor que estas sean pequeñas, no utulizae punteros o atributos que no siempre se usen en el programa, comprender en que momento es mejor usar metodos normales o virtuales dependiendo de las necesidades del programa, por ejemplo, solo usar metodos virtuales cuando se necesite polimorfismo

# Sección 3 

## Profundizando en el encapsulamiento 

### ¿Cómo implementa el compilador el encapsulamiento en C++?

Cuando el compilador implementa el encapsulamiento este restringe el acceso en la etapa de compilacion, este pasa ya que el copilador asocia cada clase con una tabla de simbolos los cuales son la información de cada miembro, luego para cada miembro guarda un codigo para acceder a el, cuando se usa un miembro el compilador compara el acceso contra los codigos que guardo de cada miembro

### Si los miembros privados aún ocupan espacio en el objeto, ¿Qué impide que se acceda a ellos desde fuera de la clase? 

El compilador prohibe que se escriba codigo que acceda directamente a esas direcciones de memoria usando el nombre del miembro

### ¿Qué es el encapsulamiento y cuál es su propósito en la programación orientada a objetos? 

Es un principio de POO que consiste en ocultar los detalles internos de una base y exponer solo lo necesario para que los datos internos de la clase no se vean en riesgo

### ¿Por qué es importante proteger los datos de una clase y restringir el acceso desde fuera de la misma? 

Es importante proteger el acceso desde afuera porque se pueden llegar a editar los datos internos de alguna clase lo que en ciertos casos puede ser riesgoso, tambien esto ayuda a reducir errores accidentales y evitar bugs

### ¿Qué significa reinterpret_cast y cómo afecta la seguridad del programa? 

reinterpret_cast es uno de los operadores de casting explicitos en c++, este sirve para reinterpretar los bits de un obejto como si fueran de otro tipo, pero no altera la memoria

### ¿Por qué crees que se pudo acceder a los miembros privados de MyClass en este experimento, a pesar de que el compilador normalmente lo impediría? 

Creo que se pudo acceder porque se rompen las reglas del encapsulamiento usando reinterpret_cast, ya que en reinterpret_cast se trata la dirección como si fuese un entero (int) y eso hace que no se respeten las restricciones de acceso porque el compilador no puede verificas si el puntero corresponde a un miembro privado o no

### ¿Cuáles podrían ser las consecuencias de utilizar técnicas como las mostradas en este experimento en un programa real? 

Usar este tipo de tecnicas pueden traer comportamientos indefinidos en el programs que puede hacer que el programa tenga algun error o de plano deje de funcionar, tambien puede provocar vulnerabilidades de seguridad lo que pone en riesgo los datos que hay dentro del programa

### ¿Qué implicaciones tiene este experimento sobre la confianza en las barreras de encapsulamiento que proporciona C++? 

Que como tal el encapsulamiento no garantiza seguridad permanente dentro del programa ya que puede ser facilmente modificada para acceder a los datos usando tecnicas maliciosas

## Herencia y la Relación en Memoria 

### ¿Cómo se organizan los atributos en memoria? 

Primero se coloca en memoria el subobjeto Base dentro de Derived, despues se colocan los miembros propios de Derived, por ello los atributos estan almacenados de forma contigua en la memoria

### ¿Qué sucede si agregamos más niveles de herencia?

Al agregar mas niveles de herencia se anidan los bloques de memoria uno dentro del otro, en este caso la clase mas derivada contieme la base en la parte inicial, luego las variables de las clases intermedias

## Polimorfismo y Vtables en detalle 

### ¿Cómo utiliza el programa las vtables para el polimorfismo? 

En este caso el programo usa punteros vptr y vtables para decidir en tiempo de ejecución que version de makeSound ejecutar

### ¿Cuál es el impacto en el rendimiento? 

Al tener polimorfismo dinamico con vtable hay una pequeña demora de tiempo y memoria, pero ofrece una gran flexibilidad y extensibilidad

###  ¿Cómo funciona el polimorfismo en C++ a nivel interno? Explica cómo se utilizan las vtables para resolver métodos virtuales en una jerarquía de herencia. 

El polimorfismo se implementa mediante vtables y vptrs, las vtables contienen punteros a las funciones virtuales que la clase implementa, entonces al llamar a un metodo virtual, el programa consulta la vtable de la clase real del objeto y ejecuta la funcion correcta

### ¿Cómo se implementan internamente el encapsulamiento, la herencia y el polimorfismo? 



### Análisis: ventajas y desventajas en términos de eficiencia y complejidad.


