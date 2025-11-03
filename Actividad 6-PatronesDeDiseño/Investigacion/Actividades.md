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

<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/09233a30-7201-48f2-beca-d16970461a63" />

### Adiciona un nuevo estado. 

En este caso cree un estado de parpadeo que al presionar la tecla "b" las particulas comienzan a parpadear simultaneamente 

https://github.com/user-attachments/assets/55438514-52f4-4fcd-b755-ac89092cb386

### Modifica el comportamiento de las partículas. 

Hice dos pruebas, que pasaria si todas las particulas se encuentran suscritas al observer menos las particulas cuadradas, para esto comente addObserver(p); en la fabrica de particulas en la sección especifica de las particulas cuadradad y luego inicie el programa, como se ve en el video, todas las demas particulas son notificadas de un cambio de estado menos las particulas cuadradas las cuales siguen en el estado normal al no ser notificadas y no cambiar de estado

https://github.com/user-attachments/assets/39c2a15b-2dc8-4be6-97d3-9eeb3bc1f6fe

### Crea otros eventos para notificar a las partículas. 

Cree un estado mas para que todas las particulas al presionar la tecla "c" van cambiado de color en el esquema del arcoiris

https://github.com/user-attachments/assets/2f62dd19-aa97-4900-848f-ac113ef580ff


