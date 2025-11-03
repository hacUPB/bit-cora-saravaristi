//Puntos 1 al 7
// 1. Carga en D el valor 1978
@1978
D=A

// 2. Guarda en la posición 100 de la RAM el número 69
@69
D=A
@100
M=D

// 3. Guarda en la posición 200 de la RAM el contenido de la posición 24 de la RAM
@24
D=M
@200
M=D

// 4. Lee lo que hay en la posición 100 de la RAM, resta 15 y guarda el resultado en la posición 100 de la RAM
@100
D=M
@15
D=D-A
@100
M=D

// 5. Suma RAM[0], RAM[1] y la constante 69. Guarda el resultado en RAM[2]
@0
D=M
@1
D=D+M
@69
D=D+A
@2
M=D

// 6. Si el valor almacenado en D es igual a 0 salta a la posición 100 de la ROM
@100
D;JEQ

// 7. Si RAM[100] < 100 salta a la posición 20 de la ROM
@100
D=M
@100
D=D-A
@20
D;JLT


//8. Considera el siguiente programa:

@var1
D = M
@var2
D = D + M
@var3
M = D
    
//¿Qué hace este programa?

//Se carga el contenido de la variable var1 a D, que luego le suma el contenido de var2 y para finalizar est guarda el resultado en la variable var3

//En qué posición de la memoria está `var1`, `var2` y `var3`? ¿Por qué en esas posiciones?

//@var1 = RAM[16]
//@var2 = RAM[17]
//@var3 = RAM[18]

//RAM[16+] : espacio libre para variables nuevas, es por esto que sus ubicaciones son 16, 17 y 18

//9. Considera el siguiente programa: 

//¿Qué hace este programa?

//Inicializa la variable i en 1 y la variable sum en 0, luego suma i a sum e incrementa i en 1

//¿En qué parte de la memoria RAM está la variable `i` y `sum`? ¿Por qué en esas posiciones?

//Estas variables son símbolos nuevos, por tanto: i será asignado a RAM[16] y sum a RAM[17]

//Optimiza esta parte del código para que use solo dos instrucciones:
        
@i
M=M+1

        
//10. Las posiciones de memoria RAM de 0 a 15 tienen los nombres simbólico `R0` a `R15`. Escribe un programa en lenguaje ensamblador que guarde en `R1` la operación `2 * R0`

@R0
D=M
@R0
D=D+M
@R1
M=D

//11. Considera el siguiente programa:
    
//¿Qué hace este programa?

//Cuenta hacia atrás desde 1000 hasta 0, es un bucle que decrementa i hasta que llega a 0 y termina

//¿En qué memoria está almacenada la variable i? ¿En qué dirección de esa memoria?

//Como es un símbolo definido por el usuario, el ensamblador la asignará automáticamente en la RAM a partir de la dirección 16 (si no se han declarado más variables antes)

//¿En qué memoria y en qué dirección de memoria está almacenado el comentario //i = 1000?

//Los comentarios no se almacenan en la memoria, estos son ignorados por el ensamblador y no ocupan espacio en ROM ni RAM por lo que son de apoyo

//¿Cuál es la primera instrucción del programa anterior? ¿En qué memoria y en qué dirección de memoria está almacenada esa instrucción?

//La primera instrucción es @1000 y está en la  direccion ROM[0]

//¿Qué son CONT y LOOP?

Son etiquetas que representan puntos de salto en la ROM, pero especificamente:
//LOOP marca el inicio de un bucle

//CONT es un punto de salida del bucle o de continuidad del programa

//¿Cuál es la diferencia entre los símbolos i y CONT?

//i se considera una variable que esta ubicada en RAM[16+] y guarda un valor que cambia
//CONT es una etiqueta de código, ubicada en ROM[x] que marca una posición del código para saltar (jump)

//12. Implemente en ensamblador: 

@R1      
D=M     
@R2
D=D+M    
@69
D=D+A   
@R4
M=D      

​
//13. Implementa en ensamblador: 

@R0
D=M
@NEG
D;JLT
@1
D=A
@R1
M=D
@LOOP
0;JMP
(NEG)
@1
D=-A
@R1
M=D
(LOOP)
@LOOP
0;JMP

​
//14. Se implementa en ensamblador:

@R1
A=M
D=M
@R4
M=D
 
//15. Implementa en ensamblador el siguiente problema. En la posición R0 está almacenada la dirección inicial de una región de memoria. En la posición R1 está almacenado el tamaño de la región de memoria. Almacena un -1 en esa región de memoria

@R0
D=M
@ptr
M=D       
@R1
D=M
@count
M=D     
(LOOP)   
@count
D=M
@END
D;JEQ
@ptr
A=M
M=-1
@ptr
M=M+1
@count
M=M-1
@LOOP
0;JMP
(END)
  


//16. Implementa en lenguaje ensamblador el siguiente programa:
    
//¿Qué hace este programa?

//Se crea un arreglo de 10 enteros llamado arr que inicializa una variable sum en 0 y suma los 10 elementos del arreglo arr para luego guardar el resultado en sum

//¿Cuál es la dirección base de arr en la memoria RAM?

//arr se ubica en RAM[16] ya que esta es la primera variable simbólica creada

//¿Cuál es la dirección base de sum en la memoria RAM y por qué?

//sum se ubica en RAM[26], porque arr[0] a arr[9] ocupan RAM[16] a RAM[25], y sum se declara despues de ello

//¿Cuál es la dirección base de j en la memoria RAM y por qué?

//j se ubica en RAM[27], porque es la siguiente variable simbólica declarada después de sum	

//17. Implementa en lenguaje ensamblador:
@7
D=A
@7
D=D-A
@69
D;JEQ

    
//18. Utiliza [esta](https://nand2tetris.github.io/web-ide/bitmap) herramienta para dibujar un bitmap en la pantalla

//[Enlace a bitmap](https://nand2tetris.github.io/web-ide/bitmap#accept)

(draw)
	// put bitmap location value in R12
	// put code return address in R13
	@SCREEN
	D=A
	@R12
	AD=D+M
	// row 1
	@4096 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	M=1
	// row 2
	D=A // D holds previous addr
	@31
	AD=D+A
	@7678 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	M=1
	// row 3
	D=A // D holds previous addr
	@31
	AD=D+A
	@15101 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 4
	D=A // D holds previous addr
	@32
	AD=D+A
	@16321 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 5
	D=A // D holds previous addr
	@32
	AD=D+A
	@125 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	M=1
	// row 6
	D=A // D holds previous addr
	@31
	AD=D+A
	@14594 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	@31 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 7
	D=A // D holds previous addr
	@31
	AD=D+A
	@512 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@248 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 8
	D=A // D holds previous addr
	@31
	AD=D+A
	@768 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@128 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	@3 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 9
	D=A // D holds previous addr
	@30
	AD=D+A
	@768 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@3584 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@12 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 10
	D=A // D holds previous addr
	@30
	AD=D+A
	@256 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@16128 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	@51 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 11
	D=A // D holds previous addr
	@30
	AD=D+A
	@384 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@256 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@102 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 12
	D=A // D holds previous addr
	@30
	AD=D+A
	@384 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@256 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@64 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 13
	D=A // D holds previous addr
	@30
	AD=D+A
	@192 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@256 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@192 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 14
	D=A // D holds previous addr
	@30
	AD=D+A
	@192 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@256 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@128 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 15
	D=A // D holds previous addr
	@30
	AD=D+A
	@192 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@4352 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@128 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 16
	D=A // D holds previous addr
	@30
	AD=D+A
	@1664 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	@3584 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	@64 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 17
	D=A // D holds previous addr
	@30
	AD=D+A
	@30976 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	@515 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@64 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 18
	D=A // D holds previous addr
	@30
	AD=D+A
	@384 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@3078 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@56 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 19
	D=A // D holds previous addr
	@30
	AD=D+A
	@1728 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@4092 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	@15 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 20
	D=A // D holds previous addr
	@30
	AD=D+A
	@832 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@8 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 21
	D=A // D holds previous addr
	@31
	AD=D+A
	@352 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@9 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 22
	D=A // D holds previous addr
	@31
	AD=D+A
	@96 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@9 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 23
	D=A // D holds previous addr
	@31
	AD=D+A
	@32704 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	@13 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 24
	D=A // D holds previous addr
	@31
	AD=D+A
	@32576 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	@4 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 25
	D=A // D holds previous addr
	@31
	AD=D+A
	@128 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@6 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 26
	D=A // D holds previous addr
	@31
	AD=D+A
	@768 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	@3 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 27
	D=A // D holds previous addr
	@31
	AD=D+A
	@512 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	M=1
	// return
	@R13
	A=M
	D;JMP
    

//19. Analiza el siguiente programa en lenguaje de máquina: 

0100000000000000
1110110000010000
0000000000010000
1110001100001000
0110000000000000
1111110000010000
0000000000010011
1110001100000101
0000000000010000
1111110000010000
0100000000000000
1110010011010000
0000000000000100
1110001100000110
0000000000010000
1111110010101000
1110101010001000
0000000000000100
1110101010000111
0000000000010000
1111110000010000
0110000000000000
1110010011010000
0000000000000100
1110001100000011
0000000000010000
1111110000100000
1110111010001000
0000000000010000
1111110111001000
0000000000000100
1110101010000111

//Traducción:

@16384
D=A
@16
D=D+A
@24576
D=A
@19
D=D-A
@16
D=A
@16384
D=D|A
@4
D=D-A
@16
M=D
D=0
@4
0;JMP

//¿Qué hace este programa?

//Calcula una dirección base: 16384 + 16 = 16400, luego se realizan otras operaciones con valores como 24576 y 19 para despue almacenar el valor 16396 en RAM[16] y por ultimo se hace un salto incondicional a una dirección anterior (@4 → 0;JMP), lo que genera un ciclo infinito 

//20. Implementa un programa en lenguaje ensamblador que dibuje el bitmap que diseñaste en la pantalla solo si se presiona la tecla “d”.

@KBD        // Dirección del teclado
D=M         // D = valor de la tecla presionada
@100        // ASCII de 'd'
D=D-A       // D = D - 100
@draw
D;JEQ       // Si D == 0 (tecla 'd' presionada), salta a (draw)
@END
0;JMP       // Si no, salta al final (no dibuja)