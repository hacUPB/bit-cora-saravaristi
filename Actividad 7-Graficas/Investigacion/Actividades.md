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

Al modificar el codigo dentro de draw y ejecutar el programa solo se muestra una pantalla en blanco, ya que no se inicializa el shader

### ¿Cómo funciona? 

### ¿Qué resultados obtuviste? 

### ¿Estás usando un vertex shader? 

### ¿Estás usando un fragment shader? 

### Analiza el código de los shaders. ¿Qué hace cada uno?

