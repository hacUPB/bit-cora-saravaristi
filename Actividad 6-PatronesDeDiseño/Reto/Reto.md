# Reto 

## Idea 

Como tal mi idea es hacer un generador de pasteles, donde las particulas son las diferentes capas del pastel y algunas de estas sirven como decoración, las decoraciones pueden cambiar, las capas del pastel cambian de color y se puede hacer que el pastel cambie de tamaño en sus capas

### Observer 

Observer en este caso se encarga de notificar a las particulas en especifico cuando se presiona una tecla que tiene interacción con ellas, por ejemplo al presionar la tecla k, observer le notifica a las particulas del pastel de la interacción

### Factory 

En este caso factory de encarga de crear los diferentes tipos de particulas, tanto las capas de los pasteles como los tipos de decoraciones

### State

Hay dos estados en el programa: NormalState y ColorRotateState, en el caso de NormalState es el estado por prederteminado a la hora de abrir e programa, osea el pastel siempre va a estar de cierta forma al inicial el programa y en ColorRotateState los colores de las capas del pastel cambian de color

## Proceso 

Dentro del proceso si tuve algunas fallas con el codigo, por ejemplo muchas veces el observer no funcionaba para ciertas particulas como las destinadas a ser la decoración ya que al cambiar de estado ya sea de color o de posición estas seguian en el mismo estado prederteminado, tambien tuve problemas con algunos estados ya que muchas veces estos se aplicaban a todas las particulas en vez de una en especifico, por ejemplo, yo queria cambiar las capas del pastel, pero las decoraciones se veian afectadas tambien y cambiaban de color, lo mismo pasaba a la inversa.

Para resolver estos problemas tuve que volver a revisar la teoria de observer y state para vver que tenia mal y asi poderlo resolver, lo que hice fue agregar un for en observer donde detectaba que tecla y a que particula partenecia junto con su interacción para solo notificar esa particula y cambiar su estado, asi el estado no se aplicaria a todas las demás particulas.

Para probar que cada estado y el observer funcionaran correctamente, lo que hice fue comentar los for de las demas particulas, para que estas no fueran a ejecutarse durante las pruebas, de esta forma podia ver qeu errores ocasionaba el observer y si el estado se ejecutaba correctamente

## Capturas 

<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/ad6c72b1-02ed-4a8e-8287-2aecca4c1210" />

<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/45606fea-8c4d-4270-9356-da9166dbc5c9" />
 
<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/fd011d79-6020-48ff-92e6-2e5e50ff02ac" /> 

<img width="1026" height="807" alt="image" src="https://github.com/user-attachments/assets/024578cb-89ab-47b6-962f-e27c3177e13c" /> 

<img width="769" height="540" alt="image" src="https://github.com/user-attachments/assets/effac7a5-607d-4d0c-9cca-7a8d43332a67" /> 

## Codigo 

ofApp.h 

```cpp 
#pragma once
#include "ofMain.h"
#include <algorithm>
#include <memory>
#include <string>
#include <vector>

// ---------------------- OBSERVER ----------------------
class IObserver {
public:
	virtual void onNotify(const std::string & event) = 0;
	virtual ~IObserver() = default;
};

class Subject {
	std::vector<IObserver *> observers;

public:
	void addObserver(IObserver * o) { observers.push_back(o); }
	void clearObservers() { observers.clear(); }
	void notify(const std::string & event) {
		for (auto * o : observers)
			if (o) o->onNotify(event);
	}
};

// ---------------------- PARTICLE ----------------------
class Particle : public IObserver {
public:
	bool isDecoration = false;
	int layerIndex = 0;
	ofVec2f pos;
	float w = 0, h = 0;
	int decoType = 0;
	ofColor color;

	Particle(ofVec2f p, float width, float height, ofColor c)
		: isDecoration(false)
		, pos(p)
		, w(width)
		, h(height)
		, color(c) { }

	Particle(ofVec2f p, float size, int layerIdx, int dType, ofColor c)
		: isDecoration(true)
		, layerIndex(layerIdx)
		, pos(p)
		, w(size)
		, decoType(dType)
		, color(c) { }

	void draw() {
		if (isDecoration) {
			if (decoType == 0) { // círculos rojos medianos
				ofSetColor(color);
				ofDrawCircle(pos, w);
			} else if (decoType == 1) { // círculos pequeños rojos oscuros
				ofSetColor(color);
				ofDrawCircle(pos, w * 0.6f);
			}
		} else {
			ofSetColor(color);
			ofDrawRectangle(pos.x - w / 2, pos.y, w, h);
		}
	}

	void onNotify(const std::string & event) override { }
};

// ---------------------- FACTORY ----------------------
class ParticleFactory {
public:
	static std::shared_ptr<Particle> createLayer(float cx, float y, float width, float height, ofColor c) {
		return std::make_shared<Particle>(ofVec2f(cx, y), width, height, c);
	}

	static std::shared_ptr<Particle> createDecorationForLayer(
		float cx, float topY, float layerWidth, int layerIdx, int decoType, ofColor c) {
		float x = cx - layerWidth * 0.5f + ofRandom(10, layerWidth - 10);
		float y = topY + ofRandom(6, 40);
		float size = ofRandom(6, 10);
		return std::make_shared<Particle>(ofVec2f(x, y), size, layerIdx, decoType, c);
	}
};

// ---------------------- STATE ----------------------
class ofApp;

class CakeState {
public:
	virtual void applyState(ofApp * app) = 0;
	virtual std::string name() const = 0;
	virtual ~CakeState() = default;
};

class NormalState : public CakeState {
public:
	void applyState(ofApp * app) override;
	std::string name() const override { return "Normal"; }
};

class ColorRotateState : public CakeState {
public:
	void applyState(ofApp * app) override;
	std::string name() const override { return "RotateColors"; }
};

// ---------------------- OFAPP ----------------------
class ofApp : public ofBaseApp, public Subject {
public:
	void setup() override;
	void update() override { }
	void draw() override;
	void keyPressed(int key) override;

	void createInitialCake(int numLayers = 4);
	void repositionCakeKeepCount();
	void generateDecorationsKeepTypes();
	void applyPalette();

	std::vector<std::shared_ptr<Particle>> layers;
	std::vector<std::shared_ptr<Particle>> decorations;

	std::vector<ofColor> palette;
	std::unique_ptr<CakeState> currentState;

	int decorationType = 0;
	float centerX = 0;
	float baseY = 0;
};
``` 

ofApp.cpp 

```cpp 
#include "ofApp.h"

// ---------------------- STATES ----------------------
void NormalState::applyState(ofApp * app) {
	app->applyPalette();
}

void ColorRotateState::applyState(ofApp * app) {
	if (app->palette.size() > 1) {
		std::rotate(app->palette.begin(), app->palette.begin() + 1, app->palette.end());
	}
	app->applyPalette();
	app->notify("PALETTE_ROTATED");
}

// ---------------------- APP ----------------------
void ofApp::setup() {
	ofSetWindowTitle("Generador de pasteles");
	ofBackground(40, 40, 45);
	ofSetCircleResolution(60);

	centerX = ofGetWidth() / 2.0f;
	baseY = ofGetHeight() / 2.0f + 120;

	palette = {
		ofColor(255, 255, 255),
		ofColor(255, 200, 200),
		ofColor(255, 230, 200),
		ofColor(255, 182, 193)
	};

	createInitialCake(4);
	currentState = std::make_unique<NormalState>();
}

void ofApp::createInitialCake(int numLayers) {
	layers.clear();
	decorations.clear();
	clearObservers();

	float layerHeight = 48;
	float baseWidth = 340;
	float widthStep = 56;

	// Base abajo, capas más angostas hacia arriba
	for (int i = 0; i < numLayers; i++) {
		float width = baseWidth - i * widthStep;
		float topY = baseY - i * (layerHeight + 0);
		ofColor c = palette[i % palette.size()];
		layers.push_back(ParticleFactory::createLayer(centerX, topY, width, layerHeight, c));
	}

	// Crear decoraciones iniciales
	int totalDecor = 30;
	for (int i = 0; i < totalDecor; i++) {
		int layerIdx = (int)ofRandom(0, layers.size());
		ofColor decoColor;

		if (decorationType == 0)
			decoColor = ofColor(220, 0, 0);
		else if (decorationType == 1)
			decoColor = ofColor(150, 0, 0);
		else
			decoColor = ofColor(255, 100, 100);

		auto d = ParticleFactory::createDecorationForLayer(centerX, layers[layerIdx]->pos.y,
			layers[layerIdx]->w, layerIdx, decorationType, decoColor);
		decorations.push_back(d);
	}

	for (auto & L : layers)
		addObserver(L.get());
	for (auto & D : decorations)
		addObserver(D.get());
}

void ofApp::repositionCakeKeepCount() {
	if (layers.empty()) return;

	int numLayers = layers.size();
	float layerHeight = 48;
	float layerGap = 0;
	float baseWidth = ofRandom(300, 380);
	float widthStep = ofRandom(40, 70);

	for (int i = 0; i < numLayers; i++) {
		float width = baseWidth - i * widthStep;
		float topY = baseY - i * (layerHeight + layerGap);
		layers[i]->w = width;
		layers[i]->pos.set(centerX, topY);
	}


	// Reubicar decoraciones sobre las nuevas capas
	for (auto & dec : decorations) {
		int idx = ofClamp(dec->layerIndex, 0, (int)layers.size() - 1);
		float lw = layers[idx]->w;
		float topY = layers[idx]->pos.y;
		dec->pos.set(centerX - lw * 0.5f + ofRandom(10, lw - 10),
			topY + ofRandom(6, 40));
	}
}

void ofApp::generateDecorationsKeepTypes() {
	decorations.clear();

	int totalDecor = 30;
	for (int i = 0; i < totalDecor; i++) {
		int layerIdx = (int)ofRandom(0, layers.size());
		ofColor decoColor;

		if (decorationType == 0)
			decoColor = ofColor(220, 0, 0);
		else if (decorationType == 1)
			decoColor = ofColor(150, 0, 0);
		else
			decoColor = ofColor(255, 100, 100);

		auto d = ParticleFactory::createDecorationForLayer(centerX, layers[layerIdx]->pos.y,
			layers[layerIdx]->w, layerIdx, decorationType, decoColor);
		decorations.push_back(d);
	}
}

void ofApp::applyPalette() {
	for (size_t i = 0; i < layers.size(); i++) {
		layers[i]->color = palette[i % palette.size()];
	}
}

void ofApp::draw() {
	for (auto & L : layers)
		L->draw();
	for (auto & D : decorations)
		D->draw();

	ofSetColor(240);
	ofDrawBitmapString("Presiona 'n' para nuevo pastel (solo posiciones)", 20, 30);
    ofDrawBitmapString("Presiona 'd' para cambiar decoraciones", 20, 50);
    ofDrawBitmapString("Presiona 'k' para cambiar esquema de colores", 20, 70);
}

void ofApp::keyPressed(int key) {
	if (key == 'n' || key == 'N') {
		repositionCakeKeepCount();
	} else if (key == 'd' || key == 'D') {
		decorationType = (decorationType + 1) % 3;
		generateDecorationsKeepTypes();
	} else if (key == 'k' || key == 'K') {
		currentState = std::make_unique<ColorRotateState>();
		currentState->applyState(this);
	}
}
```

## Video demostrativo 

[Reto unidad 6](https://youtu.be/tWw6Elk5zRw)