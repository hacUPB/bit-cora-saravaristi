# Reto

## Idea

Un sistema de partículas generativo, donde cada partícula puede tener un comportamiento distinto (lineal, caótico, con atracción, etc.). Todas las partículas se gestionan de forma unificada, pero se comportan diferente gracias al polimorfismo.

El resultado será una visualización viva, con variaciones de movimiento y estética, que podrás ir documentando en tu bitácora con base en cómo OOP organiza la memoria y estructura del programa.

### Encapsulamiento 

### Herencia 

### Polimorfismo 

### Codigo  

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

