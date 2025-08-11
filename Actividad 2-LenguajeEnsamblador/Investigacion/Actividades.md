# Unidad 2 Lenguaje Ensamblador 

## Actividad 01 

### ¿Qué es la entrada-salida mapeada a memoria? 

Es cuando los dispotivos de entrada y salida se encuentran ubicados en el mismo espacio de RAM, por lo que el sistema puede utilizar estos dispositivos de entrada y salida usando las mismas instrucciones que se le dan a la RAM para poder interactuar con estos dispositivos

### ¿Cómo se implementa en la plataforma Hack? 

En hack se utilizan 16383 registros en RAM para guardar datos, el espacio 16384 se destina para la pantalla y el espacio 24575 se destina al teclado el cual solo lee los datos de la tecla presionada. 

### Inventa un programa que haga uso de la entrada-salida mapeada a memoria. 
    (LOOP)
    @24576
    D=M
    @ON
    D;JGT
    @16384
    M=0
    @LOOP
    0;JMP
    (ON)
    @16384
    M=-1
    @LOOP
    0;JMP

### Investiga el funcionamiento del programa con el simulador. 

https://github.com/user-attachments/assets/0e134e06-7250-49f8-b10e-2d7d80430b90 

En el video se muestra como al presionar cualquier tecla se dibuja una linea en la pantalla y al dejar de presionar alguna tecla esta linea se borra de la pantalla, esto se debe a que que el programa lee el valor en RAM[24576] y si detecta que esta es mayor a 0 es porque alguna tecla esta siendo presionada, en cambio si es igual a 0 significa que no hay teclas siendo presionadas. En caso de que una tecla este siendo presionada se escribe -1 en RAM[16384] lo que genera que se dibuje la linea en pantalla usando los 16 pixeles de esa ubicación, pero si no hay tecla se escribe 0 en RAM[16384] y se apagan los 16 pixeles que se encuentran en esa posición borrando la linea

## Actividad 02 

Se reviso el codigo y su funcionammiento, a continuación se adjunta el codigo 

```
@KBD        // Dirección del teclado
D=M         // D = valor de la tecla presionada
@100        // ASCII de 'd'
D=D-A       // D = D - 100
@draw
D;JEQ       // Si D == 0 (tecla 'd' presionada), salta a (draw)
@END
0;JMP       // Si no, salta al final (no dibuja) 
```

