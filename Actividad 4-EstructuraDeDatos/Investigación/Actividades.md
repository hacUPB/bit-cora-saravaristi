# Actividad 01 

### 2. Realiza evaluaciones formativas. Dile a ChatGPT que te genere preguntas para verificar si entiendes cómo funciona el programa. Trata de verificar tus hipótesis usando el depurador y luego con las conclusiones del experimento responde la pregunta de ChatGPT. Continúa con este proceso hasta que estés seguro de que entiendes cómo funciona el programa. 

#### Preguntas hechas por ChatGPT

### Si el constructor de LinkedList ya crea un nodo inicial, ¿cuántos nodos hay realmente después de setup()?

Hay 11 nodos en total, tomando en cuenta el nodo que a se creo en LinkedList() y los otros 10 nodos que se crean en setup()

### ¿Qué ocurriría si se olvidara llamar a delete en la función clear()?

lo que pasaria es que no se eliminarian los nodos como tal, posiblemente sus posiciones se perderian y no seria posible acceder a ellos 

### ¿Por qué en el método addNode se actualiza tail cada vez que se agrega un nodo?

Se actualiza a tail porque cada nodo nuevo debe de tomar esta posición y asi los demas vayan intercalando de posición hasta llegar a head que es la cabeza de la serpiente en este caso

### ¿Qué pasa si la lista está vacía y se llama a display()?

Simplemente no se dibujaria la serpiente ya que no hay nodos en la lista enlazada, por lo tanto no hay nada que dibujar

### Explica en tus palabras cómo un nodo “sabe” qué posición tomar en cada actualización.

No es que cada nodo tenga clara su posicion, cada una de estas posiciones se van intercalando a medida que se agregan nuevo nodos

### 3. ¿Qué es una lista enlazada y en qué se diferencia de un arreglo en cuanto a la forma en que los elementos están almacenados en la memoria?

Como tal la lista enlazada es una estructura donde cada elemento apunta al siguiente, en este caso head y tail apuntan al mismo nodo, por otro lado en cuanto a como estan almacenados los elementos en memoria, en las listas enlazadas cada nodo tiene su dato, un puntero y referencia al siguiente nodo, mientras que un arreglo almacena sus elementos en bloques de memoria contiguos

### 4. Al observar el código de una lista enlazada en C++, ¿Cómo crees que se vinculan los nodos entre sí? ¿Qué estructura se utiliza para lograr esta conexión? 

En este caso se vinculan con punteros, esto se hace de esta forma ya que cada nodo se compone por los datos que le pertenecen y un puntero que apunta al siguiende nodo de la lista enlazada 

### 5. ¿Cómo se gestiona la memoria en una lista enlazada? Investiga cómo se crea y se destruye un nodo en memoria utilizando el operador new y delete en C++. 

Una lista enlazada se maneja con los operadores new y delete para la asignacion y desasinagción de nodos, donde new reserva memoria para un nuevo nodo y devuelve el puntero a el, mientras que delete limpia esa memoria y llama al destructor si ese nodo existe 

### 6. Considerando la estructura de una lista enlazada, ¿qué ventajas ofrece en comparación con un arreglo cuando se trata de insertar o eliminar elementos en posiciones intermedias? 

Es bastante facil ya que solo se necesita ajustar los punteros de los nodos

### 7. En el código presentado, ¿Cómo se asegura que no haya fugas de memoria? ¿Qué papel juega el destructor en la clase LinkedList? 

En este caso no hay fugas de memoria gracias a clear() y al destructor de la clase LinkedList. En el codigo el destructor de LinkedList se ejecuta cada vez que un objeto deja de existir, por ello al llamar clear() en el destructor se garantiza que todos los nodos creados por new se liberen y que no quede memoria perdida en el heap

### 8. ¿Qué sucede en la memoria cuando se invoca el método clear() en una lista enlazada? Explica paso a paso cómo se liberan los recursos. 

Cuando se invoca el metodo clear() se borran todos los nodos y quedan vacias las listas de update() y display(), por lo que no se vuelven a generar nodos automaticamente

### 9. Explica cómo cambia la estructura en memoria de una lista enlazada al agregar un nuevo nodo al final de la lista. ¿Cómo afecta esto al rendimiento de la lista enlazada? 

Al insertar un nodo nuevo, a este se le da un puntero next configurado a null, el puntero next del ultimo nodo se modifica para que apunte a este nuevo nodo, lo que actualiza la estructura en la memoria

### 10. Analiza una situación en la que utilizar una lista enlazada sería más ventajoso que utilizar un arreglo. Justifica tu respuesta considerando la gestión de memoria y las operaciones de inserción y eliminación. 

Al investigar un poco creo que una posible situación donde una lista enlazada es mejor que usar un arreglo es en un sistema de gestion de procesos de un sistema operativo, donde estos procesos llegan y salen constantemente de la memoria, en este caso es mucho mas ventajoso usar una lista enlazada ya que si se usa un arreglo este corre el riesgo de llenarse y luego tener que crear mas arreglos segun la necesidad, pero si se usa una lista enlazada cada uno de los nodos se crea con new y solo se usa la memoria necesaria en cada momento, lo que evita el desperdicio de memoria y permite manejar un numero de elemntos de forma eficiente

### 11. Después de estudiar el manejo de memoria en listas enlazadas, ¿Cómo aplicarías este conocimiento para diseñar una estructura de datos personalizada para una aplicación creativa? ¿Qué aspectos considerarías para asegurar la eficiencia y evitar fugas de memoria? 

Creo que con lo explicado en este ejercicio, esta estructura se podria implementar en algun juego, por ejemplo, un juego donde de naves espaciales donde se tiene que eliminar filas con movimiento en zigzag de enemigos evitando que lleguen al jugador, si el jugador deja que alguno de los enemigos lo toque, todos desaparecen y se le quita una vida al jugador (en este caso los enemigos serian los nodos que van cambiando de posición constantemente hasta llegar al jugador y atacarlo)

### 12. Reflexiona sobre las diferencias en la gestión de memoria entre C++ y un lenguaje con recolección de basura automática como C#. ¿Qué ventajas y desafíos encuentras en la gestión explícita de memoria en C++ al trabajar con estructuras de datos? 

Como tal algunas de las ventajas que hay son la libertad de crear objetos y eliminarlos usando new y delete, otra ventaja puede ser el hecho de que se puede administrar la memoria directamente. Por otro lado algunos de los desafios que hay son los llamados "punteros colgantes", es decir, cuando se quiere acceder a memoria ya liberada lo que puede provocar errores o comportamientos raros en el codigo si no se hace un apartado especifico para acceder a memorias ya liberadas, otro desafio es la posibilidad de tener memorias fragmentadas, al reservar y liberar memorias en patrones irregulares

### 13. Imagina que estás optimizando una pieza de arte generativo que usa listas enlazadas para representar elementos en movimiento. ¿Qué consideraciones tomarías en cuenta para garantizar que la gestión de la memoria sea eficiente y que no ocurran fugas de memoria? 

Primero haria un sistema donde cada new tiene un delete, tambien implementaria un metodo clear() para que en algun momento pueda recorrer la lista y eliminar los nodos cuando lo necesite. Otra cosa que haria seria evitar las dobles liberaciones, esto se hace llevando a los puntero a nullptr despues de hacer delete, por ejemplo, head = nullptr;

### 14. Pruebas: pregunta a ChatGPT cómo podrías probar las partes del programa y el programa completo. Luego realiza las pruebas y verifica si los resultados coinciden con tus expectativas. 


# Actividad 02 

### 2. Realiza evaluaciones formativas. Dile a ChatGPT que te genere preguntas para verificar si entiendes cómo funciona el programa. Trata de verificar tus hipótesis usando el depurador y luego con las conclusiones del experimento responde la pregunta de ChatGPT. Continúa con este proceso hasta que estés seguro de que entiendes cómo funciona el programa.

#### Preguntas de ChatGPT 

### ¿Qué representan los punteros front y rear en la clase Queue? 

En este caso Front representa el nodo que esta primero en la fila y rear el que esta de ultimo en esta misma fila 

### Cuando se hace enqueue(x,y) en una cola vacía, ¿qué ocurre con front y rear? 

Lo que pasa es que el nodo creado pasa a ser el primero y el utimo de la fila a la misma vez ya que no hay ningun otro nodo que ocupe el ultimo lugar 

### En enqueue, ¿por qué es necesario actualizar rear->next?

Es necesario ya que se usa para mover a cada uno de los nodos hacia atras cuando se crea un nuevo nodo que va a estar de primero en la fila

### ¿Qué diferencia clave hay entre el orden de eliminación en una pila y en una cola?

La diferencia que hay aqui es que en el caso de pila, el ultimo nodo creado es el primer nodo en ser eliminado, mientras que con una cola el primer nodo en ser creado es el primero en ser eliminado

### ¿Qué representa el puntero top dentro de la clase Stack?

Top siempre esta apuntando al nodo mas nuevo, osea el nodo que esta en la parte superior de la pila 

### ¿Cuál es la diferencia entre newNode y top en una pila? 

La diferencia es que newNode sirve para crear un nodo nuevo que va a estar en la parte superior de la pila, mientras que top solo apunta a este nuevo nodo creado

### ¿Por qué en push se hace newNode->next = top antes de top = newNode?

Esto se hace para crear un puntero que apunte a la caja a la caja que estaba en la cima antes de crear el nuevo nodo y asi hacer que top apunte al nuevo nodo que esta en la cima de la pila

## Preguntas de reflexión para el stack: 

### 1. ¿Cómo se gestiona la memoria en una implementación manual de un stack en C++? Reflexiona sobre cómo el uso de new y delete en la creación y destrucción de nodos afecta el rendimiento y la seguridad de tu programa. 

En este caso al hacer un push se creaba automaticamente un nodo con new, por lo que ese nodo ocupa memoria en heap, no en el stack de ejecución dentro del programa, luego al hacer pop se elimina el nodo con delete lo que libera ese espacio de memoria

### 2. ¿Por qué es importante liberar la memoria cuando se desapila un nodo en un stack? Considera las consecuencias de no liberar memoria en términos de fugas de memoria y cómo esto puede impactar aplicaciones de largo tiempo de ejecución. 

Es importante liberar la memoria en estos casos ya que pueden ser un problema que puede llevar a comportamientos raros donde se pueden eliminar los nodos de forma incorrecta y el programa sufra algun error

### 3.¿Qué diferencias existen entre usar un stack de la STL (std::stack) y crear un stack manualmente? Explora cómo la abstracción que proporciona la STL puede simplificar la implementación, pero también cómo una implementación manual ofrece mayor control sobre la gestión de recursos. 

Al usar std::stack se simplifica la implementación ya que abstrae la gestión de memoria y reduce errores, pero esto limita el funcionamiento interno, en cambio el stack manual tiene sus ventajas porque tiene mayor flexibilidad, pero requiere de manejar manualmente new y delete, lo que puede aumentar los errores de punteros y las fugas de memorias

### 4. ¿Cómo afecta la estructura de un stack al orden de acceso y eliminación de elementos? Analiza cómo la naturaleza LIFO (Last In, First Out) del stack influye en los tipos de problemas que esta estructura de datos puede resolver eficientemente. 

A la hora de acceder a alguno de los nodos solo se puede mirar y extraer el ultimo nodo creado (osea el nodo que se encuentra en el puntero top), pero a la hora de querer eliminar un nodo se usa pop y se elimina el nodo mas reciente, pero no los que estan abajo

### 5. ¿Cómo podrías modificar el stack para almacenar tipos de datos más complejos (e.g., objetos con múltiples atributos) sin causar problemas de memoria? Reflexiona sobre cómo gestionar adecuadamente la memoria para objetos más complejos y cómo esto afectaría tu implementación actual. 

Si se quieren generar datos mas complejos, se debe de generar una estructura con plantillas y garantizar la correcta gestión de memoria. Esto se puede hacer implementando constructores y destructores y usando punteros inteligentes como std::unique_ptr

## Preguntas de autoevaluación: 

### 1. ¿Puedo explicar detalladamente cómo funciona el proceso de apilar y desapilar nodos en un stack, incluyendo la gestión de memoria? 

En mi caso creo que si puedo explicar el proceso de apilar y desapilar los nodos en un stack, pero aun debo de comprender mas a fondo su funcionamiento en la gestión de memoria

### 2. ¿Soy capaz de identificar y corregir una fuga de memoria en una implementación de stack manual? 

Para corregir una fuga de memoria se debe verificar que para cada vez que se hace new Node haya un delete que le corresponda en algun momemnto, por ejemplo si al hcer pop() el puntero solo cambia a top, pero no hace delete se esta generando una fuga de memoria ya que no se elimina el nodo correspondiente, para corregirlo, se deben eliminar los nodos al hacer pop() y limpiar todos en el destructor

### 3. ¿Puedo modificar el stack para que incluya una función que busque un elemento específico, sin alterar el orden de los elementos apilados? 

Si se puede modificar, para esto hay que crear un puntero Node* actual que empiece en top y vaya bajando con ->next, en cada paso se revisan si el nodo actual contiene al nodo que se esta buscando

### 4. ¿Entiendo cómo la estructura LIFO del stack afecta el flujo de datos y puedo dar ejemplos de problemas que se resuelvan mejor con un stack? 

Creo que comprendo el funcionamiento de la estructura LIFO del stack, pero creo que aun no puedo dar ejemplos claros de problemas qjue se resuelvan mejor usando esa estructura, siento que me falta utilizar mas las pilas para poder comprenderlas mejor

### 5. ¿Puedo implementar y depurar un stack para tipos de datos más complejos, asegurándome de que no haya fugas de memoria ni errores de puntero? 

Si se puede implementar y depurar un stack con datos mas complejos, todo depende de que tan bien este estructurado el destructor en los nodos, tambien verificar que cada new tenga su delete, para evitar las fugas de memoria

## Preguntas de reflexión para la queue:

### 1. ¿Cómo se maneja la memoria en una implementación manual de una queue en C++? Reflexiona sobre cómo se gestionan los nodos al encolar y desencolar elementos y las implicaciones en términos de eficiencia y seguridad. 

La memoria funciona creando primero un nodo con new el cual se enlaza al final de la lista y el puntero rear se actualiza para apuntar al nodo recien creado, ya para eliminar nodos se toma el nodo del frente o sea front, se guarda el puntero al siguiente nodo y el nodo que esta en front se elimina con delete, luego se actualiza el puntero front

### 2. ¿Qué desafíos específicos presenta la implementación de una queue en comparación con un stack en términos de gestión de memoria? Considera las diferencias en el manejo de punteros front y rear, y cómo estos afectan el proceso de encolado y desencolado. 

Como tal es mas desafiante la gestión de memoria en colas que en pilas, ya que se deben de estructurar bien los punteros front y rear para evitar eliminar o agregar incorrectamente nodos, mientras que en las pilas solo se necesita manejar el puntero top

### 3. ¿Cómo afecta la estructura FIFO (First In, First Out) de una queue a su uso en diferentes tipos de problemas? Analiza cómo la estructura FIFO influye en la resolución de problemas donde el orden de procesamiento es crucial, como en sistemas de colas de espera. 

Como tal la estructura FIFO garantiza que los nodos se procesen en el mismo orden en elq ue llegaron lo que puede ser util para problemas donde el orden de llegada sea fundamental

### 4. ¿Cómo podrías implementar una queue circular y cuál sería su ventaja respecto a una queue lineal en términos de uso de memoria? Reflexiona sobre cómo una queue circular puede mejorar la eficiencia en ciertos contextos y qué cambios serían necesarios en la implementación. 

Para implementar un queue circular se deben de usar front y rear, pero tambien hay que agregar capacidad a la fila, por ejemplo, un arreglo que tiene tamaño 5 y cuando rear llega a la posición 4, el siguiente nodo creado se posiciona en la posición 0, siempre que estan no este ocupada

### 5. ¿Qué problemas podrían surgir si no se gestionan correctamente los punteros front y rear en una queue, y cómo podrías evitarlos? Considera posibles errores como la pérdida de referencias a nodos y cómo una gestión cuidadosa de los punteros puede prevenir estos problemas. 

Uno de los problemas mas frecuentes seria la perdida de referencia de nodos ya que si no se actualiza correctamente se puede perder acceso al nodo eliminado sin liberar su memoria, otro caso puede si rear o front se encuentran apuntando a una memoria ya liberada, cualquier acceso posterior puede provocar errores en el programa

## Preguntas de autoevaluación:

### 1. ¿Puedo explicar claramente el proceso de encolar y desencolar nodos en una queue, incluyendo la gestión de memoria? 

Creo que si comprendo el proceso para encolar y desencolar y entiendo como funciona su gestión de memoria

### 2. ¿Soy capaz de identificar y corregir problemas relacionados con la gestión de los punteros front y rear en una queue? 

Para resolver problemas de este tipo hay que verificvar que los punteros front y rear esten apuntando a los nodos correctos ya que pueden producir fugas de memoria o errores en el programa a la hora de agregar y eliminar nodos

### 3. ¿Puedo modificar la queue para implementar una queue circular, entendiendo cómo esto afectaría la gestión de memoria? 

Si claro, hay que tener en cuenta la capacidad de nodos que hay y que a la hora de agregar nodos en la posición 0, asegurarse de que esta posición no se encuentra ocupada

### 4. ¿Entiendo cómo la estructura FIFO de una queue afecta el flujo de datos y puedo dar ejemplos de problemas que se resuelvan mejor con una queue? 

En este caso si comprendo en que tipo de situaciones podria ser mejor utilizar una cola dependiendo del tipo de problema que se presente

### 5. ¿Puedo implementar y depurar una queue para tipos de datos más complejos, asegurándome de que no haya fugas de memoria ni errores de puntero?

Para evitar fugas de memorias se podrian crear un destructor clear() para eliminar todos los nodos o tambien un destructor en Node para que cada nodo elimina a su puntero Node* cuando se elimina
