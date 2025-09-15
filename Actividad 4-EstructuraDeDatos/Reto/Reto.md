# Idea
## Noche de estrellas

La idea como tal es un programa donde aparezcan diferentes tipos de estrellas, todas con un patron diferente, donde cada uno de ellos va a ser una lista enlazada, un arreglo o una cola

### Arreglo
El arreglo se va a mostrar visualmente como estrellas que parpadean y siguen un patron de derecha a izquierda, donde hay un numero fijo de particulas

### Lista enlazada
La lista enlazada va a servir para crear visualmente estelas que se mueven por la pantalla, ya que cada nodo se va intercalando de posición y asi se genera el efecto de estela

### Cola
La cola en este caso va a funcionar dejando pequeñas huellas cada cierto tiempo en la misma posición en la que se encuentra el mouse en el momento, en este caso el orden de eliminación seria que la huella mas antigua es la que desaparece primero


# Desarrollo
La verdad tuve problemas para crear las colas ya que muchas veces o aparecian en el lado derecho y se creaban a partir de varios clicks o simplemente no se creaban, por lo que cambie su forma de funcionar para que las huellas aparecieran en la pantalla sin necesidad de usar click, como tal la lista enlazada no tuvo errores y los arreglos no presentaron complicaciones

## Codigo 

OfApp.h

``` c++
#pragma once
#include "ofMain.h"
#include <deque>
#include <memory>
#include <vector>

// ----------------- Star (arreglo) -----------------
struct Star {
	ofVec2f pos;
	float brightness;
	Star(float x = 0, float y = 0)
		: pos(x, y)
		, brightness(ofRandom(0.5, 1.0)) { }
	void update() { brightness = 0.5 + 0.5 * sin(ofGetElapsedTimef() * 2 + pos.x * 0.01); }
	void draw() const {
		ofSetColor(255 * brightness);
		ofDrawCircle(pos, 1.5);
	}
};

// ----------------- Lista enlazada (serpiente) usando unique_ptr -----------------
struct Segment {
	ofVec2f pos;
	std::unique_ptr<Segment> next;
	Segment(float x, float y)
		: pos(x, y)
		, next(nullptr) { }
};

class LinkedSnake {
public:
	std::unique_ptr<Segment> head; // ownership chain
	float life = 6.0f; // vida en segundos (opcional)
	float bornTime = ofGetElapsedTimef();

	LinkedSnake() = default;
	// crear con longitud inicial:
	void init(int length, float cx, float cy) {
		head = std::make_unique<Segment>(cx, cy);
		Segment * tail = head.get();
		for (int i = 1; i < length; i++) {
			tail->next = std::make_unique<Segment>(cx, cy);
			tail = tail->next.get();
		}
		bornTime = ofGetElapsedTimef();
	}
	bool isDead() const { return ofGetElapsedTimef() - bornTime > life; }

	void update(const ofVec2f & leader) {
		// similar a tu update: head toma la posición del líder, cadena copia prev pos
		float prevX = leader.x, prevY = leader.y;
		Segment * cur = head.get();
		while (cur) {
			float tempX = cur->pos.x;
			float tempY = cur->pos.y;
			cur->pos.set(prevX, prevY);
			prevX = tempX;
			prevY = tempY;
			cur = cur->next.get();
		}
	}
	void draw() const {
		Segment * cur = head.get();
		int i = 0;
		while (cur) {
			ofSetColor(255 - i * 10, 100 + i * 5, 150);
			ofDrawCircle(cur->pos, 6 - i * 0.2);
			cur = cur->next.get();
			++i;
		}
	}
};

// ----------------- ofApp -----------------
class ofApp : public ofBaseApp {
public:
	// arreglo de estrellas
	std::vector<Star> stars;
	const int MAX_STARS = 300;

	// varias serpientes (lista enlazada)
	std::vector<std::unique_ptr<LinkedSnake>> snakes;
	const int MAX_SNAKES = 8;

	// pila (LIFO) - ráfagas
	std::vector<ofVec2f> burstStack;
	const int MAX_BURST = 200;

	// cola (FIFO) - huellas
	std::deque<std::pair<ofVec2f, float>> trailQueue; // pair(pos, bornTime)
	const int MAX_TRAIL = 100;

	// parámetros visuales
	void setup();
	void update();
	void draw();
	void keyPressed(int key);
	void exit(); // limpieza adicional si quieres
	float lastTrailTime;
	float trailInterval;
};
```

OfApp.cpp 

```c++
#include "ofApp.h"

void ofApp::setup() {
	ofSetBackgroundColor(10);

	// estrellas
	stars.reserve(MAX_STARS);
	for (int i = 0; i < MAX_STARS; i++) {
		stars.emplace_back(ofRandomWidth(), ofRandomHeight());
	}

	// lista de serpientes vacía
	snakes.clear();

	// cola vacía
	trailQueue.clear();

	// inicializar temporizador
	lastTrailTime = 0;
	trailInterval = 2.0f; // huella cada 2 segundos
}

void ofApp::update() {
	// actualizar estrellas
	for (auto & s : stars)
		s.update();

	// crear serpientes aleatorias con baja frecuencia
	if (ofRandom(1.0) < 0.005 && snakes.size() < MAX_SNAKES) {
		auto s = std::make_unique<LinkedSnake>();
		s->init(ofRandom(8, 24), ofRandomWidth(), ofRandomHeight());
		snakes.push_back(std::move(s));
	}

	// actualizar snakes
	for (auto it = snakes.begin(); it != snakes.end();) {
		ofVec2f leader(
			ofNoise(ofGetElapsedTimef() * 0.2 + std::distance(snakes.begin(), it) * 10) * ofGetWidth(),
			ofNoise(ofGetElapsedTimef() * 0.15 + std::distance(snakes.begin(), it) * 20) * ofGetHeight());
		(*it)->update(leader);

		if ((*it)->isDead()) {
			it = snakes.erase(it);
		} else
			++it;
	}

	// ---- Cola: encolar huellas automáticamente cada cierto tiempo ----
	float now = ofGetElapsedTimef();
	if (now - lastTrailTime > trailInterval) {
		if (trailQueue.size() >= MAX_TRAIL) trailQueue.pop_front();
		trailQueue.emplace_back(ofVec2f(ofGetMouseX(), ofGetMouseY()), now);
		lastTrailTime = now;
	}

	// eliminar huellas viejas
	while (!trailQueue.empty() && now - trailQueue.front().second > 3.0f) {
		trailQueue.pop_front();
	}
}

void ofApp::draw() {
	// estrellas
	for (const auto & s : stars)
		s.draw();

	// huellas (cola FIFO)
	for (const auto & p : trailQueue) {
		float age = ofGetElapsedTimef() - p.second;
		float alpha = ofMap(age, 0, 3.0, 255, 20, true);
		ofSetColor(100, 200, 255, alpha);
		ofDrawCircle(p.first, 8);
	}

	// serpientes
	for (const auto & s : snakes)
		s->draw();

	// HUD
	ofSetColor(255);
	ofDrawBitmapString("Las huellas (cola FIFO) aparecen cada 2s\nTecla S = nueva serpiente | Tecla C = limpiar", 10, 20);
}

void ofApp::keyPressed(int key) {
	if (key == 's') {
		if (snakes.size() < MAX_SNAKES) {
			auto s = std::make_unique<LinkedSnake>();
			s->init(ofRandom(8, 24), ofRandomWidth(), ofRandomHeight());
			snakes.push_back(std::move(s));
		}
	} else if (key == 'c') {
		snakes.clear();
		trailQueue.clear();
	}
}

void ofApp::exit() {
	snakes.clear();
	trailQueue.clear();
	stars.clear();
}
```

## Capturas del proceso


## Video
[Enlace a mi video](https://youtu.be/foas3fMwvYE)