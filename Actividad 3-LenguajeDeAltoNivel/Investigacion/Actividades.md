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

## Actividad 06 

### El código anterior tiene un problema. ¿Puedes identificar cuál es? ¿Cómo lo solucionarías? Recuerda que deberías poder seleccionar una esfera y moverla con el mouse. 

Como tal el problema es que no se puede soltar la esfera seleccionada, ya que no se tiene un evento que permita deseleccionar la esfera dentro del codigo, por lo que hay que crear un evento nuevo llamado mouseReleased donde se instancie que al soltar el click izquierdo del mouse sea que selectedSphere = nullptr; 

### Solución 

``` cpp
#pragma once

#include "ofMain.h"

class Sphere {
public:
	Sphere(float x, float y, float radius);
	void draw();
	void update(float x, float y);
	float getX();
	float getY();
	float getRadius();

private:
	float x, y;
	float radius;
	ofColor color;
};

class ofApp : public ofBaseApp {

public:
	void setup();
	void update();
	void draw();

	void mouseMoved(int x, int y);
	void mousePressed(int x, int y, int button);
	void mouseReleased(int x, int y, int button);

private:
	vector<Sphere *> spheres;
	Sphere * selectedSphere;
}; 
```
Se instancia el metodo publico mouseRealeased 

``` cpp
//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button) {
	if (button == OF_MOUSE_BUTTON_LEFT) {
		selectedSphere = nullptr;
	}
}
```
Se crea el evento mouseRealeased donde si se deja de presionar el click izquierdo del mouse se instancia que selectedSphere = nullptr; 

## Actividad 07 

### ¿Qué sucede cuando presionas la tecla “c”? 

Al presionar la tecla "c" el programa dice que se esta apuntando a un objeto y se intenta dibujar el objeto en pantalla, pero por mas que se espere a que el objeto se dibuje en la pantalla esto no pasa, tambien guarda la posición de este objeto y aparece como 0,0 

<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/38350fd0-d9e1-4f2e-a6b0-920ae247e6da" />


### Luego de la modificación en createObjectInStack 

### ¿Qué sucede cuando presionas la tecla “c”? 

Al presionar la tecla "c" se apunta a un objeto y se dibuja un circulo en la pantalla para luego guardar la posición de este mismo (este objeto obtiene una posición y color diferente cada vez que se depura el programa)

<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/c7d2384a-b054-416b-86d9-c1b4fb9fdb7b" /> 

### ¿Por qué ocurre esto? 

Si no estoy mal esto ocurre por dentro del codigo que se nos dio al inicio no existe el puntero entonces no se apunta a ningun objeto, tambien hay que tener en cuenta que el objeto se esta creando en heap y no en stack, esto es importante ya que heap se usa para datos que existen mas alla de las funciones basicas, por lo que stack es mas rapido, pero heap es mas eficiente para este tipo de casos 

## Actividad 08 

### Programa 

```cpp
#pragma once
#include "ofMain.h"


class Objeto {
public:
	string nombre;
	ofColor color;
	float x, y, r;

	Objeto(string n, float _x, float _y, float _r, ofColor c)
		: nombre(n)
		, x(_x)
		, y(_y)
		, r(_r)
		, color(c) { }

	void dibujar() {
		ofSetColor(color);
		ofDrawCircle(x, y, r);
	}


	
};

extern Objeto globalObj;

class ofApp : public ofBaseApp {
public:
	void setup();
	void update();
	void draw();
	Objeto * heapObj;
};

```
```cpp
#include "ofApp.h"


Objeto globalObj("Global", 400, 300, 40, ofColor::blue);




//--------------------------------------------------------------
void ofApp::setup() {
	ofBackground(0);
	heapObj = new Objeto("Heap", 300, 300, 50, ofColor::red);
}

//--------------------------------------------------------------
void ofApp::update() {
	Objeto stackObj("Stack", 500, 100, 30, ofColor::purple);
	stackObj.dibujar();
}

//--------------------------------------------------------------
void ofApp::draw() {
	ofBackground(0); 
	ofSetColor(ofColor::cyan);
	ofDrawCircle(600, 300, 80);

	
	globalObj.dibujar();

	
	if (heapObj != nullptr) {
		heapObj->dibujar();
	}

	
	Objeto temp("StackDraw", ofRandom(100, ofGetWidth() - 100),
		ofRandom(100, ofGetHeight() - 100),
		20, ofColor::purple);
	temp.dibujar();
}
```
https://github.com/user-attachments/assets/1d5910e8-0b9c-4474-af19-c5ef1bcd2563


El programa funciona de forma que se muestran circulos que representan heap, stack y global, dentro del codigo heap es el circulo rojo, este se mantiene durante toda la ejecución del codigo, luego esta stack que es representado por los circulos morados que aparecen en diferentes posiciónes y no mantienen una posición exacta durante la ejecución del codigo, luego esta global que es representado por el circulo cyan grande, este esta durante toda la ejecución del codigo y mantiene su posición.
 
### ¿Cuándo debo crear objetos en el heap y cuándo en memoria global? 

Heap se usa cuando se necesitan objetos grandes, un objeto que viva mas alla del alcance de la función donde se creo. En cuanto de global estasn se necesitan cuando se quieren crear configuraciones o constantes que se necesitan durante toda la ejecución del programa, si se quiere que el objeto exista desde el inicio del programa hasta que este finalize



## Actividad 09 

### ¿Qué sucede cuando presionas la tecla “f”? 

Al presionar "f" se va borrando uno a uno cada objeto creado en heap memory, se borran desde el mas nuevo hasta la mas antiguo, como si de deshiciera la acción mas actual 

https://github.com/user-attachments/assets/a137766d-ef8d-44e0-903b-615647f21e5f 

### Analiza detalladamente esta parte del código: 

``` cpp
if(!heapObjects.empty()) {
    delete heapObjects.back();
    heapObjects.pop_back();
}
```
Esta parte como tal se refiere a la accion que se hace al presionar la tecla "f" donde si heapObjects se encuentra vacio de todas formas hace la acción de borrar 

```cpp 
#pragma once
#include "ofMain.h"

class ofApp : public ofBaseApp {
public:
	void setup();
	void update();
	void draw();

	void keyPressed(int key);
	void mousePressed(int x, int y, int button);

	void convertMouseToRay(int mouseX, int mouseY, glm::vec3 & rayStart, glm::vec3 & rayEnd);
	bool rayIntersectsSphere(const glm::vec3 & rayStart, const glm::vec3 & rayDir,
		const glm::vec3 & sphereCenter, float sphereRadius,
		glm::vec3 & intersectionPoint);

	// Cámara
	ofEasyCam cam;

	// Posiciones de las esferas
	vector<glm::vec3> spherePositions;

	// Parámetros
	int xStep, yStep;
	float distDiv, amplitud;
	float sphereRadius;

	// Selección
	bool sphereSelected;
	glm::vec3 selectedSpherePos;
};
```
```cpp
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup() {
	ofBackground(0);
	ofSetFrameRate(60);

	xStep = 20;
	yStep = 20;
	distDiv = 50.0f;
	amplitud = 150.0f;
	sphereRadius = 5.0f;

	sphereSelected = false;

	// Generar cuadrícula inicial
	for (int x = -ofGetWidth() / 2; x < ofGetWidth() / 2; x += xStep) {
		for (int y = -ofGetHeight() / 2; y < ofGetHeight() / 2; y += yStep) {
			float z = cos(ofDist(x, y, 0, 0) / distDiv) * amplitud;
			spherePositions.push_back(glm::vec3(x, y, z));
		}
	}
}

//--------------------------------------------------------------
void ofApp::update() {
	spherePositions.clear();
	for (int x = -ofGetWidth() / 2; x < ofGetWidth() / 2; x += xStep) {
		for (int y = -ofGetHeight() / 2; y < ofGetHeight() / 2; y += yStep) {
			float z = cos(ofDist(x, y, 0, 0) / distDiv) * amplitud;
			spherePositions.push_back(glm::vec3(x, y, z));
		}
	}
}

//--------------------------------------------------------------
void ofApp::draw() {
	cam.begin();

	for (auto & pos : spherePositions) {
		if (sphereSelected && pos == selectedSpherePos) {
			// Esfera seleccionada en morado
			ofSetColor(138, 43, 226);
			ofDrawSphere(pos, sphereRadius * 1.5);
		} else {
			//Degradado de color en función de Y
			ofColor startColor = ofColor::cyan; // color abajo
			ofColor endColor = ofColor::pink; // color arriba

			float factor = ofMap(pos.y, -200, 200, 0, 1, true);
			ofSetColor(startColor.lerp(endColor, factor));

			ofDrawSphere(pos, sphereRadius);
		}
	}

	cam.end();

	// HUD
	ofSetColor(220);
	ofDrawBitmapString("FPS: " + ofToString(ofGetFrameRate()), 20, 20);
	ofDrawBitmapString("Step: " + ofToString(xStep), 20, 40);
	ofDrawBitmapString("DistDiv: " + ofToString(distDiv), 20, 60);
	ofDrawBitmapString("Amplitud: " + ofToString(amplitud), 20, 80);

	if (sphereSelected) {
		ofDrawBitmapString("Seleccionada: " + ofToString(selectedSpherePos.x) + ", "
				+ ofToString(selectedSpherePos.y) + ", "
				+ ofToString(selectedSpherePos.z),
			20, 100);
	}
}


//--------------------------------------------------------------
void ofApp::keyPressed(int key) {
	if (key == OF_KEY_UP) amplitud += 10;
	if (key == OF_KEY_DOWN) amplitud -= 10;
	if (key == OF_KEY_RIGHT) distDiv += 2;
	if (key == OF_KEY_LEFT) distDiv -= 2;
	if (key == '+') {
		xStep += 2;
		yStep += 2;
	}
	if (key == '-') {
		xStep -= 2;
		yStep -= 2;
	}
}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button) {
	glm::vec3 rayStart, rayEnd;
	convertMouseToRay(x, y, rayStart, rayEnd);

	sphereSelected = false;
	for (auto & pos : spherePositions) {
		glm::vec3 intersectionPoint;
		if (rayIntersectsSphere(rayStart, rayEnd - rayStart, pos, sphereRadius, intersectionPoint)) {
			sphereSelected = true;
			selectedSpherePos = pos;
			break;
		}
	}
}

//--------------------------------------------------------------
void ofApp::convertMouseToRay(int mouseX, int mouseY, glm::vec3 & rayStart, glm::vec3 & rayEnd) {
	glm::mat4 modelview = cam.getModelViewMatrix();
	glm::mat4 projection = cam.getProjectionMatrix();
	ofRectangle viewport = ofGetCurrentViewport();

	float x = 2.0f * (mouseX - viewport.x) / viewport.width - 1.0f;
	float y = 1.0f - 2.0f * (mouseY - viewport.y) / viewport.height;

	glm::vec4 rayStartNDC(x, y, -1.0f, 1.0f);
	glm::vec4 rayEndNDC(x, y, 1.0f, 1.0f);

	glm::vec4 rayStartWorld = glm::inverse(projection * modelview) * rayStartNDC;
	glm::vec4 rayEndWorld = glm::inverse(projection * modelview) * rayEndNDC;

	rayStartWorld /= rayStartWorld.w;
	rayEndWorld /= rayEndWorld.w;

	rayStart = glm::vec3(rayStartWorld);
	rayEnd = glm::vec3(rayEndWorld);
}

//--------------------------------------------------------------
bool ofApp::rayIntersectsSphere(const glm::vec3 & rayStart, const glm::vec3 & rayDir,
	const glm::vec3 & sphereCenter, float sphereRadius,
	glm::vec3 & intersectionPoint) {
	glm::vec3 oc = rayStart - sphereCenter;

	float a = glm::dot(rayDir, rayDir);
	float b = 2.0f * glm::dot(oc, rayDir);
	float c = glm::dot(oc, oc) - sphereRadius * sphereRadius;

	float discriminant = b * b - 4 * a * c;
	if (discriminant < 0) return false;

	float t = (-b - sqrt(discriminant)) / (2.0f * a);
	intersectionPoint = rayStart + t * rayDir;
	return true;
}
```
c:\Users\sarav\Videos\Grabaciones de pantalla\Grabación de pantalla 2025-08-24 233030.mp4
