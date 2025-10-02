# Reto

## Idea
En este caso mi reto va a ser un sistema de partículas generativo, donde cada partícula puede tener un comportamiento distinto (lineal, caótico, con atracción, etc) donde todas las partículas se gestionan de forma unificada, pero se comportan diferente por el polimorfismo, el resultado será una pantalla llena de particulas, con variaciones de movimiento y estética

### Encapsulamiento
Cada partícula tendrá atributos privados (posición, velocidad, color) y métodos públicos para manipularla lo que asegura que la lógica interna no pueda ser alterada de forma indebida desde fuera

```cpp
class Particle {
public:
	ofVec2f pos, vel;
	ofColor color;

	Particle(float x, float y) {
		pos.set(x, y);
		vel.set(ofRandom(-2, 2), ofRandom(-2, 2));
		color.setHsb(ofRandom(255), 200, 255);
	}

	virtual ~Particle() { }
	virtual void update() { pos += vel; }
	virtual void draw() {
		ofSetColor(color);
		ofDrawCircle(pos, 3);
	}
};
```
### Herencia 

Se van a crear diferentes tipos de partículas heredando de la clase base Particle
```cpp
// --------------------- Herencia: Partícula que rebota ---------------------
class BouncingParticle : public Particle {
public:
	BouncingParticle(float x, float y)
		: Particle(x, y) { }

	void update() override {
		pos += vel;
		if (pos.x < 0 || pos.x > ofGetWidth()) vel.x *= -1;
		if (pos.y < 0 || pos.y > ofGetHeight()) vel.y *= -1;
	}
};

// --------------------- Herencia: Partícula atraída al mouse ---------------------
class AttractedParticle : public Particle {
public:
	AttractedParticle(float x, float y)
		: Particle(x, y) { }

	void update() override {
		ofVec2f mouse(ofGetMouseX(), ofGetMouseY());
		ofVec2f dir = (mouse - pos).getNormalized();
		vel += dir * 0.2; // aceleración hacia el mouse
		vel.limit(5); // limitar la velocidad
		pos += vel;
	}
};
```

### Polimorfismo 

El sistema trabajará con punteros a Particle, pero en tiempo de ejecución se ejecutará el método correcto según el tipo real de partícula (gracias a las vtables)



### Codigo Inicial

ofApp.h

```cpp
#pragma once
#include "ofMain.h"

// --------------------- Clase base ---------------------
class Particle {
public:
    ofVec2f pos, vel;
    ofColor color;

    Particle(float x, float y){
        pos.set(x, y);
        vel.set(ofRandom(-2, 2), ofRandom(-2, 2));
        color.setHsb(ofRandom(255), 200, 255);
    }

    virtual ~Particle() {}
    virtual void update() { pos += vel; }
    virtual void draw()   { ofSetColor(color); ofDrawCircle(pos, 3); }
};

// --------------------- Herencia: Partícula que rebota ---------------------
class BouncingParticle : public Particle {
public:
    BouncingParticle(float x, float y) : Particle(x, y) {}

    void update() override {
        pos += vel;
        if(pos.x < 0 || pos.x > ofGetWidth())  vel.x *= -1;
        if(pos.y < 0 || pos.y > ofGetHeight()) vel.y *= -1;
    }
};

// --------------------- Herencia: Partícula atraída al mouse ---------------------
class AttractedParticle : public Particle {
public:
    AttractedParticle(float x, float y) : Particle(x, y) {}

    void update() override {
        ofVec2f mouse(ofGetMouseX(), ofGetMouseY());
        ofVec2f dir = (mouse - pos).getNormalized();
        vel += dir * 0.2;  // aceleración hacia el mouse
        vel.limit(5);      // limitar la velocidad
        pos += vel;
    }
};

// --------------------- Clase principal de la app ---------------------
class ofApp : public ofBaseApp{
public:
    void setup();
    void update();
    void draw();

    void keyPressed(int key);
    void keyReleased(int key);
    void mouseMoved(int x, int y );
    void mouseDragged(int x, int y, int button);
    void mousePressed(int x, int y, int button);
    void mouseReleased(int x, int y, int button);
    void mouseEntered(int x, int y);
    void mouseExited(int x, int y);
    void windowResized(int w, int h);
    void dragEvent(ofDragInfo dragInfo);
    void gotMessage(ofMessage msg);

    std::vector<std::unique_ptr<Particle>> particles;
};
````
ofApp.cpp 
```cpp
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofBackground(0);
    ofSetFrameRate(60);

    // Crear partículas de diferentes tipos
    for(int i=0; i<50; i++){
        particles.push_back(std::make_unique<BouncingParticle>(ofRandomWidth(), ofRandomHeight()));
    }
    for(int i=0; i<50; i++){
        particles.push_back(std::make_unique<AttractedParticle>(ofRandomWidth(), ofRandomHeight()));
    }
}

//--------------------------------------------------------------
void ofApp::update(){
    for(auto &p : particles){
        p->update();
    }
}

//--------------------------------------------------------------
void ofApp::draw(){
    for(auto &p : particles){
        p->draw();
    }
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){ }
void ofApp::keyReleased(int key){ }
void ofApp::mouseMoved(int x, int y ){}
void ofApp::mouseDragged(int x, int y, int button){}
void ofApp::mousePressed(int x, int y, int button){}
void ofApp::mouseReleased(int x, int y, int button){}
void ofApp::mouseEntered(int x, int y){}
void ofApp::mouseExited(int x, int y){}
void ofApp::windowResized(int w, int h){}
void ofApp::dragEvent(ofDragInfo dragInfo){}
void ofApp::gotMessage(ofMessage msg){}
```

### Capturas 


Esta captura es del codigo inicial sin haber hecho los cambios de optimizacion

https://github.com/user-attachments/assets/e0b4e8a2-00c7-4424-af45-6b0cfb52e257

Esta captura de pantalla es luego de la optimización del programa

https://github.com/user-attachments/assets/c250b397-a56e-4482-97fb-f32a3a54c8f7

## Experimentación 

### ¿Cómo puedo optimizar mi proyecto de arte generativo en openFrameworks para mejorar el rendimiento? ¿Qué impacto tienen los métodos virtuales y cómo puedo minimizar su sobrecarga? 

Algunas de las opciones que me dio ChatGPT para optimizar mi programa era tener un uso de memoria adecuado evitando eliminar y reservar memoria si no se necesitaba en algo fundamental, tener estructuras contiguas como arreglos para mejorar la coherencia de caché, utilizar ofVboMesh para dibujar todas las partículas en una sola llamada ya que tiene una gran mejora en los FPS del programa y limitar acceso a funciones del sistema como ofGetWidth(), ofGetMouseX() en variables locales dentro de update()

### Utiliza las herramientas de Visual Studio para medir el uso de memoria y rendimiento. 

<img width="1438" height="701" alt="image" src="https://github.com/user-attachments/assets/85034602-7d50-4921-a9b2-b334e8274d0f" />

<img width="1429" height="130" alt="image" src="https://github.com/user-attachments/assets/3f40f2bc-2ffb-4046-874d-284ea1fadd4a" /> 


<img width="1433" height="519" alt="image" src="https://github.com/user-attachments/assets/170a29f0-7ba6-4d94-8858-a79cb0f574a9" />

### Codigo corregido 

ofApp.h  

```cpp 
#pragma once
#include "ofMain.h"

// --------------------- Clase base con CRTP ---------------------
template <typename Derived>
class ParticleBase {
public:
    ofVec2f pos, vel;
    ofColor color;

    ParticleBase(float x, float y){
        pos.set(x, y);
        vel.set(ofRandom(-2, 2), ofRandom(-2, 2));
        color.setHsb(ofRandom(255), 200, 255);
    }

    void update() { static_cast<Derived*>(this)->updateImpl(); }
    void draw()   { static_cast<Derived*>(this)->drawImpl(); }
};

// --------------------- Partícula que rebota ---------------------
class BouncingParticle : public ParticleBase<BouncingParticle> {
public:
    using ParticleBase::ParticleBase;

    void updateImpl(){
        pos += vel;
        if(pos.x < 0 || pos.x > ofGetWidth())  vel.x *= -1;
        if(pos.y < 0 || pos.y > ofGetHeight()) vel.y *= -1;
    }

    void drawImpl(){
        ofSetColor(color);
        ofDrawCircle(pos, 3);
    }
};

// --------------------- Partícula atraída al mouse ---------------------
class AttractedParticle : public ParticleBase<AttractedParticle> {
public:
    using ParticleBase::ParticleBase;

    void updateImpl(){
        ofVec2f mouse(ofGetMouseX(), ofGetMouseY());
        ofVec2f dir = (mouse - pos).getNormalized();
        vel += dir * 0.2;
        vel.limit(5);
        pos += vel;
    }

    void drawImpl(){
        ofSetColor(color);
        ofDrawCircle(pos, 3);
    }
};

// --------------------- Clase principal de la app ---------------------
class ofApp : public ofBaseApp{
public:
    void setup();
    void update();
    void draw();

    std::vector<BouncingParticle> bouncingParticles;
    std::vector<AttractedParticle> attractedParticles;
};
```
ofApp.cpp 

```cpp 
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofBackground(0);
    ofSetFrameRate(60);

    bouncingParticles.reserve(50);
    attractedParticles.reserve(50);

    for(int i=0; i<50; i++){
        bouncingParticles.emplace_back(ofRandomWidth(), ofRandomHeight());
    }
    for(int i=0; i<50; i++){
        attractedParticles.emplace_back(ofRandomWidth(), ofRandomHeight());
    }
}

//--------------------------------------------------------------
void ofApp::update(){
    for(auto &p : bouncingParticles) p.update();
    for(auto &p : attractedParticles) p.update();
}

//--------------------------------------------------------------
void ofApp::draw(){
    for(auto &p : bouncingParticles) p.draw();
    for(auto &p : attractedParticles) p.draw();
}
```
### ¿Cómo influyó el entendimiento de los mecanismos internos de OOP en el proyecto?

En este caso me ayudo a formar un programa mucho mas rapido y con mejores tecnicas que no las habria usado o implementado si no hubiese sido por los conceptos aprendidos en este unidad

### ¿Qué desafíos enfrentaste y cómo los superaste?

Lo que mas me costo fue llevar a la practica los terminos de polimorfismo, metodos virtuales y los punteros a funciones ya que no sabia de que forma los podia poner en practica a la hora de crear el programa del reto

### ¿Qué aprendiste sobre el equilibrio entre diseño y eficiencia?

Aprendi que la verdad es fundamental comprender la teoria y saber para que funciona cada cosa y como puede hacer que un programa sea mucho mas eficiente y evitar errores o riesgos si se necesita tratar con información delicada


