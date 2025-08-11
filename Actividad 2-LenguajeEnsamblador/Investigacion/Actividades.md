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



## Actividad 02 

Se reviso el codigo y su funcionammiento, a continuación se adjunta el codigo 
@KBD        // Dirección del teclado
D=M         // D = valor de la tecla presionada
@100        // ASCII de 'd'
D=D-A       // D = D - 100
@draw
D;JEQ       // Si D == 0 (tecla 'd' presionada), salta a (draw)
@END
0;JMP       // Si no, salta al final (no dibuja) 





