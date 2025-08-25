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
