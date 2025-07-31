# Unidad 2 Lenguaje Ensamblador 

## Actividad 01 

### ¿Qué es la entrada-salida mapeada a memoria? 



### ¿Cómo se implementa en la plataforma Hack? 

En hack se utilizan 16383 registros en RAM para guardar datos, el espacio 16384 se destina para la pantallaa y el espacio 24575 se destina al teclado el cual solo lee los datos de la tecla presionada. 

### Inventa un programa que haga uso de la entrada-salida mapeada a memoria. 



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





