## Actividad 01 

### ¿Cuál es el resultado que se obtiene al ejecutar este programa? 

https://github.com/user-attachments/assets/8dcce087-ba1d-4ef2-84b3-bdb2946e922d 

El resultado es un circulo de color blanco que sigue el cursor hacia donde se mueva, el circulo no cambia de tamñao y tampoco desprende nignuna estela 

## Actividad 02 

https://github.com/user-attachments/assets/87fa2c36-c38a-4b8a-8dde-157f2a84eefb

### ¿Qué fue lo que incluimos en el archivo .h? 

Dentro de la clase offApp se instancian los metodos publicos setup, draw, update, mouseMoved y mousePressed, donde mouseMoved y mousePressed son funciones callback que funcionan cuando se presiona o se mueve el cursor

### ¿Cómo funciona la aplicación? 

La aplicación funciona siguiendo el movimiento del cursor y creando una estela de circulos que se van agregando a medida que se mueve el cursor, pero estos tienen un limite de 100 y se dibuja una mas se borra la mas antigua para poner el ciruclo mas nueva al inicio 

### ¿Qué hace la función mouseMoved? 

Esta función guarda la posicion del cursor cada vez que se mueve y si detecta que ya se dibujaron 100 circulos borra el mas antiguo

### ¿Qué hace la función mousePressed? 

Esta función genera un color aleatorio entre 0 a 255 para los valores de rojo, verde y azul para luego aplicar este color en todas las particulas

### ¿Qué hace la función setup? 

Define que el color predeterminado de las particulas sea blanco

### ¿Qué hace la función update? 

En este caso bno tiene una función como tal ya que se encuentra vacio, pero nos da a entender que las particulas solo cambian en base a l movimiento del cursor

### ¿Qué hace la función draw? 

Dibuja las particulas en la pantalla a medida que se detecta el movimiento del cursor y se agregan o borran particulas dependiendo de si hay mas de 100 y cambbia de color las particulas dependiendo de cual es el color seleccionado al presionar el mouse 

## Actividad 03 

### Analiza la aplicación anterior. ¿Qué hace cada función? ¿Qué hace cada línea de código? Realiza un experimento con la aplicación anterior. Modifica alguna parte importante de su código. 

SETUP: Este solo se ejecuta una vez y lo que hace es poner el fondo negro y hacer el color blanco el predeterminado para las particulas 

UPDATE: En este caso esta vacio lo que significa que no ejecuta nada y que las particuas solo se generan si se mueve el mouse 

DRAW: Se dibujan todos los circulos siguiendo el movimiento del mouse 

MOUSEMOVED: Se crea un circulo nuevo en la posición actual y si se superan los 100 circulos se borra el man antiguio 

MOUSEPRESSED: Cambia el color de las particulas al presionar el mouse (cambia entre rangos del 0 a 255 en rojo verde y azul)

### Modificación 

Para esta modificación quise hacer que cada particula tuviese su color propio al dibujarse en la pantalla y al presionar el mouse en vez de cambiar todas las particulas al mismo color, cada una de estas se le da un color random dentro del valor de 0 a 255 en rojo, verde y azul, para ello hice cambis dentro de ofApp.h, en ofApp.cpp especificamente en draw, mouseMoved y mousePressed 

``` cpp
#pragma once

#include "ofMain.h"

class ofApp : public ofBaseApp {

public:
	void setup();
	void update();
	void draw();

	void mouseMoved(int x, int y);
	void mousePressed(int x, int y, int button);

private:
	vector<ofVec2f> particles;
	vector<ofColor> colors;
};
```
Aca en ofApp.h se guarda un vector de colores en vez de un solo color en cada particula 

```cpp
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup() {
	ofBackground(0);
}

//--------------------------------------------------------------
void ofApp::update() {
}

//--------------------------------------------------------------
void ofApp::draw() {
	for (int i = 0; i < particles.size(); i++) {
		ofSetColor(colors[i]);
		ofDrawCircle(particles[i].x, particles[i].y, 50);
	}
}


//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y) {
	particles.push_back(ofVec2f(x, y));
	colors.push_back(ofColor(ofRandom(255), ofRandom(255), ofRandom(255)));

	if (particles.size() > 100) {
		particles.erase(particles.begin());
		colors.erase(colors.begin());
	}
}


//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button) {
	for (int i = 0; i < colors.size(); i++) {
		colors[i] = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));
	}
}
```
En draw se usa el color aleatorio para cada particula, en mouseMoved cada particula se crea con un color aleatorio y en mousePressed se le da un color aleatorio a cada particula que esta dibujada en la pantalla 

https://github.com/user-attachments/assets/166e0353-0a67-49da-b25f-2ace3889297d 

## Actividad 05 

### ¿Cuál es la definición de un puntero? 

Es una variable que guarda la posición de memoria de otra variable o objeto

### ¿Dónde está el puntero? 

Sphere* selectedSphere; este es el puntero dentro del codigo

### ¿Cómo se inicializa el puntero? 

selectedSphere = nullptr; esto dentro de setup

### ¿Para qué se está usando el puntero? 

Se utiliza para almacenar la posición de la esfera selecciona y moverla junto con el mouse para luego almacenar la posición de otra esfera si es seleccionada, tambien verifica si no es nullptr; 

### ¿Qué es exactamente lo que está almacenado en el puntero? 

selectedSphere->update(ofGetMouseX(), ofGetMouseY()); Aca no se guarda como tal la esfera seleccionada, pero si su posición de memoria