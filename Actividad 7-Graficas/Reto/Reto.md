# Reto 

## Modifica los colores de los fragmentos en el fragment shader. 

Utilice el ejemplo 8 como base de las modificaciones, en el caso del fragmente shader agregue un temporizador, dos colores (rojo y cyan) que se mezclan uno con el otro cuando se mueve el mouse y cambian en la textura su color pero solo en las partes que eran de color blanco originalmente, esto solo funciona cuando se amplia y se mueve la malla, por lo que los colores se mezclan cuando se interactua con la malla

## Modifica los vértices de una malla en el vertex shader. 

En el codigo original los vertices se modifican de forma que con las partes negras de la textura se movian hacia arriba y con las partes blancas de la texutras los vertices se movian hacia abajo, lo que hice fue modificar esto de forma que al mover el mouse a la derecha los vertices de la parte negra fuesen hacia arriba y las partes negras fuesen hacia abajo, al mover el mouse a la izquierda los valores se invierten

## Proceso 

Para cada una de las modificaciones tuve que investigar en la pagina de OpenFrameWorks para buscar las posibilidades que habian a la hora de modificar los codigos de los fragment shader y el vertex shader los hice uno por uno para verificar su funcionamiento y agregar de a poco las funciones, una vez que me revise que cada parte funcionara individualmente los combine e hice pruebas para comprobar que no hubiesen errores

## Codigos 

### ofApp.h 

```cpp 
#pragma once

#include "ofMain.h"

class ofApp : public ofBaseApp{
	public:
		
	void setup();
	void update();
	void draw();
	
	void keyPressed(int key);
	void keyReleased(int key);
	void mouseMoved(int x, int y);
	void mouseDragged(int x, int y, int button);
	void mousePressed(int x, int y, int button);
	void mouseReleased(int x, int y, int button);
	void windowResized(int w, int h);
	void dragEvent(ofDragInfo dragInfo);
	void gotMessage(ofMessage msg);

	ofShader shader;
	ofPlanePrimitive plane;
	ofImage img;

	ofColor meshPrevColor;
	ofColor meshTargetColor;

	float changeTime;
	float colorDuration;

	float prevMouseX;
	float mouseDir;
	float displacementScale;

	bool meshToggle;
};
```

### ofApp.cpp 

```cpp 
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
	ofDisableArbTex();
	if(ofIsGLProgrammableRenderer()){
		shader.load("shadersGL3/shader");
	}else{
		shader.load("shadersGL2/shader");
	}

	img.allocate(80, 60, OF_IMAGE_GRAYSCALE);

	plane.set(800, 600, 80, 60);
	plane.mapTexCoordsFromTexture(img.getTexture());

	meshPrevColor = ofColor::white;
	meshTargetColor = ofColor::white;
	changeTime = 5.1f;
	colorDuration = 5.1f;
	meshToggle = false;

	prevMouseX = ofGetMouseX();
	mouseDir = -1.0f;
	displacementScale = 100.0f;
}

//--------------------------------------------------------------
void ofApp::update(){
	float noiseScale = ofMap(mouseX, 0, ofGetWidth(), 0, 0.1);
	float noiseVel = ofGetElapsedTimef();

	ofPixels & pixels = img.getPixels();
	int w = img.getWidth();
	int h = img.getHeight();
	for(int y=0; y<h; y++) {
		for(int x=0; x<w; x++) {
			int i = y * w + x;
			float noiseVelue = ofNoise(x * noiseScale, y * noiseScale, noiseVel);
			pixels[i] = 255 * noiseVelue;
		}
	}
	img.update();
}

//--------------------------------------------------------------
void ofApp::draw(){

	img.getTexture().bind();

	shader.begin();

	
	shader.setUniform1f("uMouseDir", mouseDir);
	shader.setUniform1f("uDisplacementScale", displacementScale);


	shader.setUniform3f("uPrevColor",
		meshPrevColor.r / 255.0f,
		meshPrevColor.g / 255.0f,
		meshPrevColor.b / 255.0f
	);
	shader.setUniform3f("uTargetColor",
		meshTargetColor.r / 255.0f,
		meshTargetColor.g / 255.0f,
		meshTargetColor.b / 255.0f
	);
	shader.setUniform1f("uChangeTime", changeTime);
	shader.setUniform1f("uDuration", colorDuration);
	shader.setUniform1f("uTime", ofGetElapsedTimef());


	ofPushMatrix();

	
	float tx = ofGetWidth() / 2;
	float ty = ofGetHeight() / 2;
	ofTranslate(tx, ty);

	
	float percentY = mouseY / (float)ofGetHeight();
	float rotation = ofMap(percentY, 0, 1, -60, 60, true) + 60;
	ofRotateDeg(rotation, 1, 0, 0);

	plane.drawWireframe();

	ofPopMatrix();

	shader.end();

	img.getTexture().unbind();

	ofSetColor(ofColor::white);
	img.draw(0, 0);
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){

}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y){

	meshPrevColor = meshTargetColor;
	meshToggle = !meshToggle;
	if(meshToggle){
		meshTargetColor = ofColor::red;
	}else{
		meshTargetColor = ofColor::cyan;
	}
	changeTime = ofGetElapsedTimef();

	
	if (x > prevMouseX + 1) { 
		mouseDir = 1.0f;
	} else if (x < prevMouseX - 1) {
		mouseDir = -1.0f;
	}
	prevMouseX = x;
}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){

}
``` 

### shader.frag 

```cpp 
OF_GLSL_SHADER_HEADER

uniform sampler2D tex0;

uniform vec3 uPrevColor;
uniform vec3 uTargetColor;
uniform float uChangeTime;
uniform float uDuration;
uniform float uTime;

in vec2 texCoordVarying;

out vec4 outputColor;
 
void main()
{
    vec4 tex = texture(tex0, texCoordVarying);

    float t = 1.0;
    if(uDuration > 0.0) {
        t = clamp((uTime - uChangeTime) / uDuration, 0.0, 1.0);
    }

    float s = t * t * (3.0 - 2.0 * t);

    vec3 color = mix(uPrevColor, uTargetColor, s);

    
    outputColor = tex * vec4(color, 1.0);
}
```

### shader.vert 

```cpp 
OF_GLSL_SHADER_HEADER

// these are from the programmable pipeline system
uniform mat4 modelViewProjectionMatrix;
in vec4 position;
in vec2 texcoord;

// this is how we receive the texture
uniform sampler2D tex0;

uniform float uMouseDir;
uniform float uDisplacementScale;

out vec2 texCoordVarying;

void main()
{
    // get the position of the vertex relative to the modelViewProjectionMatrix
    vec4 modifiedPosition = modelViewProjectionMatrix * position;
    
    float lum = texture(tex0, texcoord).r;

    
    float dispValue = lum;
    if(uMouseDir > 0.0) {
       
        
        dispValue = 1.0 - lum;
    } else {
        
        dispValue = lum;
    }

    
    modifiedPosition.y += dispValue * uDisplacementScale;
    
    // this is the resulting vertex position
    gl_Position = modifiedPosition;

    // pass the texture coordinates to the fragment shader
    texCoordVarying = texcoord;
}
```

## Video demostrativo 

[Video demostrativo unidad 7](https://youtu.be/g1rEwwDx71g)