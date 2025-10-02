# Sección 1 

# Sección 2 

### ¿Qué hace el patrón observer en este caso? 

Lo que hace este patron es notificar a las particulas cuando hay una interación con el teclado  que corresonda alguna de las interaciones posibles dentro del programa para luego llamar al estado correspondiente a la interación y asi las particulas cambien su comportamiento dpendiendo de la tecla y el estado que esta representa

### ¿Qué hace el patrón factory en este caso?

Es una creación de diferentes particulas donde crea particulas dependiendo del caso y les asigna una tamaño y color especifico dependiendo del tipo de particula, en este caso hay 3 tipos de particulas: star, shooting star y planet, todas estas tienen tamaños y colores diferentes, pero se comportan de la misma forma

### ¿Qué hace el patrón state en este caso? 

Hace que las particulas se comporten de cierta forma dependiendo del estado en el que se encuentran, por ejemplo en el estado atract lo que pasa es que las particulas se atraen al mouse y van a la posición en la que este se encuentre, cuando esta el estado repel las particulas evitan el mouse y se mueven en todas las direcciones sin acercarse al mouse, en el estado stop todas las particulas se detienen y permanecen en la misma posición y en el estado normal las particulas se comportan de forma normal, sin tener atracción o repeler al mouse

## Experimentación 

### Adiciona un nuevo tipo de partícula. 

Cree una particula cuadrada que tuviese su propio color que en este caso es amarillo y su propio tamaño que es mas grande que las demas particulas, se comporta de la misma forma a todas las demas

### Adiciona un nuevo estado. 

### Modifica el comportamiento de las partículas. 

### Crea otros eventos para notificar a las partículas. 

# Reto

