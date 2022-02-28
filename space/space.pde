import processing.sound.*;

PImage space, sunT, mercuryT, venusT, earthT, moonT, marsT;
PShape skyBox, sun, mercury, venus, earth, moon, mars;
SoundFile spaceMusic;

int width = 800;
int height = 600;
float theta = 0;

void settings(){
  size(width, height, P3D);
  fullScreen();
}

void setup(){
  spaceMusic = new SoundFile(this, "spacemusic.mp3"); 
  spaceMusic.loop();
  spaceMusic.play();
  
  float fov = PI/3.0;
  float cameraZ = (height/2.0) / tan(fov/2.0);
  perspective(fov, float(width)/float(height), cameraZ/100, cameraZ*100);
  
  space = loadImage("space.jpg");
  sunT = loadImage("sun.jpg");
  mercuryT = loadImage("mercury.jpg");
  venusT = loadImage("venus.jpg");
  earthT = loadImage("earth.jpg");
  moonT = loadImage("moon.jpg");
  marsT = loadImage("mars.jpg");
  
  noStroke();
  
  skyBox = createShape(SPHERE, 40000);
  skyBox.setTexture(space);
  

  sun = createShape(SPHERE, 1000);
  sun.emissive(255,255,255);
  sun.setTexture(sunT);
  
  mercury = createShape(SPHERE, 100);
  mercury.setTexture(mercuryT);
  
  venus = createShape(SPHERE, 200);
  venus.setTexture(venusT);
  
  earth = createShape(SPHERE, 200);
  earth.setTexture(earthT);
  
  moon = createShape(SPHERE, 100);
  moon.setTexture(moonT);
  
  mars = createShape(SPHERE, 200);
  mars.setTexture(marsT);
  
  initCamera();
  playCamera();
  camera.setDistance(10000);
}

void draw(){
  translate(width/2, height/2);
  shape(skyBox);
  

  // Translate to center of window to draw the sun.

  shape(sun);
  pointLight(255,255,255,0,0,0);

  // Mercury rotates around the sun
  pushMatrix();
  rotate(2*theta);
  translate(2000, 0, 0);
  shape(mercury);
  popMatrix();
  
  // Venus rotates around the sun
  pushMatrix();
  rotate(1.5*theta);
  translate(3000, 0, 0);
  shape(venus);
  popMatrix();
  
  // The earth rotates around the sun
  pushMatrix();
  rotate(theta);
  translate(4500, 0, 0);
  shape(earth);
  
  // The moon rotates around the earth
  pushMatrix(); 
  rotate(-theta*4);
  translate(500, 0);
  shape(moon);
  popMatrix();
  popMatrix();
  
  // Mars rotates around the sun
  pushMatrix();
  rotate(0.9*theta);
  translate(6000, 0, 0);
  shape(mars);
  popMatrix();

  theta += 0.01;
  
  drawHUD();
}

void drawHUD(){
  camera.beginHUD();
  pushMatrix();
  
  drawLeaveText();
  
  popMatrix();
  camera.endHUD();
}

void drawLeaveText(){
  String leave = "Press ESC to QUIT \nUse the mouse to move the camera \nClick and drag to move, mousewheel to zoom";
  float size = 20f;
  textSize(size);
  text(leave, 20, 20);
}
