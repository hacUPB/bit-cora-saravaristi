## Actividad 01 

### 2. Realiza evaluaciones formativas. Dile a ChatGPT que te genere preguntas para verificar si entiendes cómo funciona el programa. Trata de verificar tus hipótesis usando el depurador y luego con las conclusiones del experimento responde la pregunta de ChatGPT. Continúa con este proceso hasta que estés seguro de que entiendes cómo funciona el programa. 

Preguntas hechas por ChatGPT

### Si el constructor de LinkedList ya crea un nodo inicial, ¿cuántos nodos hay realmente después de setup()?

Hay 11 nodos en total, tomando en cuenta el nodo que a se creo en LinkedList() y los otros 10 nodos que se crean en setup()

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



### 11. Después de estudiar el manejo de memoria en listas enlazadas, ¿Cómo aplicarías este conocimiento para diseñar una estructura de datos personalizada para una aplicación creativa? ¿Qué aspectos considerarías para asegurar la eficiencia y evitar fugas de memoria? 

Creo que con lo explicado en este ejercicio, esta estructura se podria implementar en algun juego, por ejemplo, un juego donde de naves espaciales donde se tiene que eliminar filas con movimiento en zigzag de enemigos evitando que lleguen al jugador, si el jugador deja que alguno de los enemigos lo toque, todos desaparecen y se le quita una vida al jugador (en este caso los enemigos serian los nodos que van cambiando de posición constantemente hasta llegar al jugador y atacarlo)

### 12. Reflexiona sobre las diferencias en la gestión de memoria entre C++ y un lenguaje con recolección de basura automática como C#. ¿Qué ventajas y desafíos encuentras en la gestión explícita de memoria en C++ al trabajar con estructuras de datos? 



### 13. Imagina que estás optimizando una pieza de arte generativo que usa listas enlazadas para representar elementos en movimiento. ¿Qué consideraciones tomarías en cuenta para garantizar que la gestión de la memoria sea eficiente y que no ocurran fugas de memoria? 

Primero haria un sistema donde cada new tiene un delete

### 14. Pruebas: pregunta a ChatGPT cómo podrías probar las partes del programa y el programa completo. Luego realiza las pruebas y verifica si los resultados coinciden con tus expectativas. 

