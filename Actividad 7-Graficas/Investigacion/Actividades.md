# Actividades 

## Actividad 01 

### ¿Qué son los vértices?

Son los puntos con coordenadas X, Y y Z que se conectan entre si ya que al unir tres vertices se forma un triangulo

### ¿Con qué figura geométrica se dibuja en 3D? 

En 3D se dibuja en triangulos debido a sus vertices que los hace mucho más faciles de trabajar que otras figuras geometricas

### ¿Qué es un shader?  

Es un programa o un paso fundamental en el render pipeline (como el vertex shader o el fragment shader) que se usa para calcular y aplicar el color, la iluminación y la posición de los elementos gráficos.

### ¿Cómo se le llaman a los grupos de píxeles de un mismo triángulo? 

Se le llaman fragmentos porque comparten su textura y color

### ¿Qué es un fragment shader? 

Sirve para hacer un shader en cada pixel para que la luz artificial sea lo mas realista posible

### ¿Qué es un vertex shader?  

Es el primer paso del render pipeline ya que su función principal es calcular la posición final de cada vertice en la pantalla de visualización 2D utilizando la perspectiva de la camara

### ¿Al proceso de determinar qué pixels del display va a cubrir cada triángulo de una mesh se le llama?  

Es la rasterizacion ya que La GPU toma las coordenadas X y Y de los tres vertices de un triangulo y calcula matematicamente qua pixeles especificos dentro de la cuadricula de la pantalla caen dentro de los limites del triangulo

### ¿Qué es el render pipeline?  

Es el algoritmo que transforma continuamente los datos 3D de un mundo virtual en la imagen 2D que se ve en la pantalla

### ¿Hay alguna diferencia entre aplicar un color a una superficie de una mesh o aplicar una textura?  

Si, ya que aplicar un color simple le da a la superficie un tono uniforme, mientras que una textura es una imagen detallada que se mapea sobre la superficie

### ¿Cuál es la diferencia entre una textura y un material?  

La textura es la imagen que se aplica (madera o metal), mientras que el material es el conjunto de propiedades (color, brillo, reflectividad) que define la apariencia final de la superficie e incluye la textura

### ¿Qué transformaciones se requieren para mover un vértice del 3D world al View Screen?  

Se requieren tres transformaciones secuenciales las cuales son: de model space a world space, de world space a camera space y de la perspectiva del campo de visión a la view screen

### ¿Al proceso de convertir los triángulos en fragmentos se le llama?  

Se llama rasterización porque es el proceso que usa los vertices 2D de un triangulo para determinar que pixeles especificos de la pantalla cubrira dicho triangulo

### ¿Qué es el framebuffer?  

Es el ultimo paso del render pipeline y su propósito es sombrear cada pixel con iluminación precisa, teniendo en cuenta la dirección y la intensidad de la luz, reflejos y sombras

### ¿Para qué se usa el Z-buffer o depth buffer en el render pipeline?  

Se usa para resolver el "problema de visibilidad" de esta forma almacena la distancia Z de cada pixel a la camara, solo los pixeles de los triangulos más cercanos se dibujan en la pantalla

### Luego de ver el segundo video entiendes por qué la GPU tiene que funcionar tan rápido y de manera paralela. ¿Por qué? 

Si ya que el proceso de renderizado de graficos 3D implica una combinación de volumen de datos extremo y tiempos de procesamiento muy especificos

## Actividad 02  

### Modifica ligeramente el método draw 

Al modificar el codigo dentro de draw y ejecutar el programa solo se muestra una pantalla en blanco en el primer ejemplo, en el segundo ejemplo se ve una malla que se puede mover y cambia de color, en el tercer ejercicio se ve una malla que ocupa la pantalla de color blanco, en el cuarto ejercicio se muestra un cuadrado azul en pantalla, en el quinto ejemplo se muestra la misma textura que la del ejemplo cuatro cuando no se modifica su codigo, en el ejemplo seis se muestran diferentes elementos como un video, dos shaders, una textura con una mascara y la camara del dispositivo, en el ejemplo siete se muestran diferentes controles en pantalla para hacer un dibujo y la pantalla se encuentra en blanco, en el octavo ejemplo se ve una malla que replica la textura que se muestra en la parte superior de la pantalla, ya para finalizar en el noveno ejemplo se ven dos cuadrados en la pantalla

<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/eaf033f0-2433-421b-8b88-bf9161b02337" /> 

<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/692632e1-5a22-4c5b-b101-628e5adefa61" /> 

<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/1c986271-0138-4bcc-bb27-7922ca7e48e6" />  

<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/6f990b30-e6d0-4eaa-a970-77f01fcaecc3" /> 

<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/379f37a1-9f2f-46f0-959d-cb7822c63c9d" /> 

<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/62361672-952a-48d9-820c-d85580085b70" />

<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/e4c96796-f30b-4eb0-a026-07bd73fbe201" /> 

<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/5c3802c7-2dd7-44fb-a380-240b761136d9" /> 

<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/24f94c8d-a837-4589-81bb-b41865a5ceaf" />

### ¿Cómo funciona? 

Todos los ejemplos son diferentes donde algunos combinan los shaders con funciones como el mouse moved, la camara del dispositivo, videos e imagenes. Los shaders se encargar de hacer diferentes acciones con estas, ya sea 

### ¿Qué resultados obtuviste? 

En cada uno de los ejemplos se obtuvieron difrentes tipos de shaders en pantalla 

<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/c8849923-d1f4-467f-b5ac-03a000ebf3a3" /> 

<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/1a44c5c9-b5e9-4a20-9909-62b82122355d" /> 

<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/095555ad-470a-4c98-8b9e-5b0d0ed3a40a" /> 

<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/0f800998-aee6-4641-a1ba-f32af0f686a5" /> 

<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/0aacac24-c7a6-4cdf-b53f-4755e8438aaa" /> 

<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/ab9a3b8f-54fe-4b8a-9d74-745b6a12102c" /> 

<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/c728a5d7-8b52-4c17-b005-30247283e0a3" /> 

<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/2f79807c-f3c9-44b1-9b2b-800b133073c2" />

<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/0690d82e-b395-49c2-92e2-495be2ece08c" /> 

### ¿Estás usando un vertex shader? 

### Ejemplo 1: 

Si pero solo se usa para posicionar los vertices en pantalla

### Ejemplo 2: 

El vertex shader se encarga de hacer que la malla se mueva de arriba hacia abajo como una onda 

### Ejemplo 3: 

Se encarga de deformar los vertices de la malla para formar el campo de fuerza alrededor del mouse cuando este se mueve

### Ejemplo 4: 

Este se encarga de transformar los vertices y sus posiciones para pasarlas al fragment shader y conectarlo con la textura

### Ejemplo 5: 

El vertex shader se encarga de obtener las posiciones del objeto y pasarlo a la textura del fragment shader

### Ejemplo 6: 

El vertex se encarga de obtener los datos de posición de cada elemento y pasarselos a la textura, la camara, la mascara y el video para ya luego el fragment shader se encargue de combinarlos

### Ejemplo 7: 

Tomas las posiciones de cada vertice de la malla y las transmite a las texturas para hacer el efecto de dibujado cuando hay interacción con el mouse

### Ejemplo 8: 

En este caso lo que hace es agarrar la parte negra de la textura y hace que los vertices se muevan de forma vertical y las partes blancas donde los vertices se desplazan hacia abajo

### Ejemplo 9: 

Toma las posiciones de los vertices de la malla y los manda a la textura

### ¿Estás usando un fragment shader? 

### Ejemplo 1: 

Si se usa porque estamos usando la localización de cada fragmento en pantalla para saber donde se encuentra cada pixel y asi aplicar el color correspondiente a cada uno de estos, como tal la sección del fragment shader 

### Ejemplo 2: 

En este caso le da una color a toda la malla, pero con la interaccion del mouse moved, este color seria un gradiente al mover el mouse de derecha a izquierda

### Ejemplo 3: 

Se encarga de los colores de los fragmentos que en este caso cambian cuando se mueve el mouse de derecha a izquierda

### Ejemplo 4:  

En este caso el shader se encarga de hacer que la textura se pueda mover con el mouse y tenga una resolucion

### Ejemplo 5: 

El fragment shader se encarga de mezclar la mascara y la textura en una sola

### Ejemplo 6: 

El fragment shader se encarga de mezclar la textura, el video, la camara y la mascara en uno solo

### Ejemplo 7: 

En este caso el fragment controla lo que es la mascara al combinar los trazos el pincel en la textura, los cambios de textura y la transicion entre estos

### Ejemplo 8: 

En este caso el fragment shader se encarga de hacer agrandar y achicar la textura

### Ejemplo 9: 

Si, se utiliza tanto para la textura como para el efecto gaussiano donde se tienen fragment sahder para X y Y, donde dependiendo de la interaccón del mouse se pone mas efecto o menos

### Analiza el código de los shaders. ¿Qué hace cada uno?

### Ejemplo 1: 

En este ejemplo se utiliza mas que nada el fragment shader ya que este se encarga de que color se le da a cada pixel dependiendo de su posición

### Ejemplo 2: 

El vertex se encarga del movimiento de la malla y el fragment de los colores de la malla en modo gradiente al mover le mouse

### Ejemplo 3: 

Se genera ua malla que cambiar del color al mover el mouse a los lados, al mismo tiempo los vertices se deforman alrededor del mouse formando un campo de fuerza 

### Ejemplo 4: 

El fragment se encarga del color del cuadrado y el vertex de las posiciones de los vertices de la malla

### Ejemplo 5: 

Solo se genera un cuadrado con la textura y una mascara que ambas las maneja el fragment shader y las mezcla, el vertex shader lo que hace es obtener los vertices del objeto y pasarlas a la textura

### Ejemplo 6: 

En este ejemplo se tienen diferentes valores como la camara, un video y una textura con una mascara, lo que hace el shader es combinar todos estos y permite al usuario mover el shader de un lado al otro para probar diferentes combinaciones

### Ejemplo 7: 

En este ejemplo el shader funciona como la brocha en la pantalla, que tiene diferentes opciones como borrador, aumentar el tamaño de la brocha y el alpha de la brocha, asi como apagar la textura y volverla a prender a gusto del usuario 

### Ejemplo 8: 

En este ejemplo el shader funciona replicando la forma de la textura en la malla, cuando hay espacios en color negro la malla se eleva y cuando hay espacios en blanco la malla baja y ademas hace que amplie la textura o se vuelve mas pequeña

### Ejemplo 9: 

En este ejemplo el shader sirve de forma en la que se le aplica un efecto de blur gaussian a la textura que se encuentra en la imagen, en este caso lo hace teniendo en cuenta la posición en X y Y

## Actividad 03 

### ¿Qué es un uniform?  

La forma en la que funciona uniform es haciendo que todos los pixeles dentro del fragmento compartan el mismo valor uniforme cuando son dibujados en draw

### ¿Cómo funciona el código de aplicación, los shaders y cómo se comunican estos?  

Visualmente se mustra en pantalla una malla que ahga el efecto de movimiento de la onda y cambie de color segun la posición del mouse, el vertex solo se encarga de las posiciones de los vertices de la malla, y el fragment de los colores de cada fragmento de la malla que cambian de color con el movimiento del mouse

## Actividad 04 

### ¿Qué hace el código del ejemplo? 

Lo que hace el codigo es generar una malla en la pantalla donde con el movimiento del mouse se deforma dentro de un rango que si detecta que el mouse esta dentro del rango la malla se deforma alejandose del mouse y tambien cambia de color con el movimiento horizontal del mouse

### ¿Cómo funciona el código de aplicación, los shaders y cómo se comunican estos? 

El vertex shader se encarga de la posición de los vertices de la malla y con el rango el mouse deforma la malla segun la posicioón en la que este el mouse, el fragment se encarga de los colores de la malla que van cambiando segun la posicion horizontal de la malla 

### Realiza modificaciones a ofApp.cpp y al vertex shader para conseguir otros comportamientos. 

En este caso la modificación que hice fue que los vertices de la malla en vez de alejarse del mouse se acercaran a este, dando el efecto contrario al original 

```cpp 
#version 150

uniform mat4 modelViewProjectionMatrix;
in vec4 position;

uniform float mouseRange;
uniform vec2 mousePos;
uniform float time; 
uniform vec4 mouseColor;

void main()
{
    vec4 pos = position;
    vec2 dir = mousePos - pos.xy;
    float dist = distance(pos.xy, mousePos);

    if (dist < mouseRange) {
        float distNorm = 1.0 - (dist / mouseRange);
        pos.xy += normalize(dir) * distNorm * 20.0 * sin(time * 2.0 + dist / 20.0);
    }

    gl_Position = modelViewProjectionMatrix * pos;
}
```
### Realiza modificaciones al fragment shader para conseguir otros comportamientos.

Hice una modificación donde se detecta que tan cerca se esta del mouse y de esa forma los fragmentos que se encuentren cerca del mouse tienen un color que hace que esa zona se resalte mucho mas que las otras 

```cpp 
#version 150

out vec4 outputColor;

uniform vec2 mousePos;
uniform float mouseRange;
uniform vec4 mouseColor;

in vec4 gl_FragCoord;

void main()
{

    float dist = distance(gl_FragCoord.xy, mousePos);

    float intensity = 1.0 - smoothstep(0.0, mouseRange, dist);

    outputColor = vec4(mouseColor.rgb * intensity, 1.0);
}
```
