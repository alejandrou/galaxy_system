import gifAnimation.*;

PShape sun, mercury, venus, earth, mars, moon, jupiter;

float angleSun, angleMercury, angleEarth, angleVenus, angleMoon, angleJupiter, angleMars;


PImage galaxia;
PImage sunImage, mercuryImage, venusImage, earthImage, moonImage, jupiterImage, marsImage;

GifMaker ficherogif;


void drawSolarSystem(){
  
  beginShape();
  
  sun = createShape(SPHERE,60);
  sun.setStroke(255);
  sun.setTexture(sunImage);
  
  earth = createShape(SPHERE,12);
  earth.setStroke(255);
  earth.setTexture(earthImage);
  
  mercury = createShape(SPHERE,8);
  mercury.setStroke(255);
  mercury.setTexture(mercuryImage);
  
  venus = createShape(SPHERE,15);
  venus.setStroke(255);
  venus.setTexture(venusImage);
  
  moon = createShape(SPHERE,5);
  moon.setStroke(255);
  moon.setTexture(moonImage);
  
  jupiter = createShape(SPHERE,20);
  jupiter.setStroke(255);
  jupiter.setTexture(jupiterImage);
  
  mars = createShape(SPHERE,20);
  mars.setStroke(255);
  mars.setTexture(marsImage);
  
  endShape();
  
}



void setSolarSystemRotatio(){
  
  pushMatrix();
  rotateY(radians(angleSun));
  shape(sun);
  angleSun=(angleSun%360)+0.1;
  popMatrix();
  
  pushMatrix();
  rotateZ(radians(angleEarth));
  translate(175,0);
  rotateY(radians(angleEarth));
  shape(earth);
  text("Tierra", 11, 2);
  angleEarth=(angleEarth%360)+0.4;
  
  rotateZ(radians(angleMoon));
  translate(23, 0);
  rotateY(radians(angleMoon));
  shape(moon);
  text("Luna", 11, 2);
  angleMoon=(angleMoon%360)+0.2;
  popMatrix();
  
  pushMatrix();
  rotateZ(radians(angleMercury));
  translate(80,0);
  rotateY(radians(angleMercury));
  shape(mercury);
  text("Mercurio", 11, 2);
  angleMercury=(angleMercury%360)+0.8;
  popMatrix();
  
  pushMatrix();
  rotateZ(radians(angleVenus));
  translate(125,0);
  rotateY(radians(angleVenus)); 
  shape(venus);
  text("Venus", 15, 2);
  angleVenus=(angleVenus%360)+0.75;
  popMatrix();
  
  pushMatrix();
  rotateZ(radians(angleJupiter));
  translate(280,0);
  rotateY(radians(angleJupiter));
  shape(jupiter);
  text("Jupiter", 21, 2);
  angleJupiter=(angleJupiter%360)+0.2;
  popMatrix();
  
  pushMatrix();
  rotateZ(radians(angleMars));
  translate(200,0);
  rotateY(radians(angleMars));
  shape(mars);
  text("Marte", 21, 2);
  angleMars=(angleMars%360)+0.2;
  popMatrix();
}

void keyPressed() {
if (key == 'w' || key == 'W') {
    ficherogif.finish();
  }
}

void setup()
{
  size(920,600,P3D);
  stroke(0);
  galaxia=loadImage("./images/galaxia.jpg");
  sunImage=loadImage("./images/sol.png");
  mercuryImage = loadImage("./images/mercurio.png");
  venusImage = loadImage("./images/venus.png");
  earthImage = loadImage("./images/tierra.png");
  moonImage = loadImage("./images/luna.png");
  marsImage = loadImage("./images/marte.png");
  jupiterImage = loadImage("./images/jupiter.png");
  drawSolarSystem();
  
  ficherogif = new GifMaker(this, "sistema_solar.gif");
  ficherogif.setRepeat(0);
  ficherogif.setTransparent(0,0,0);
  
}


void draw()
{
  background(galaxia);
  translate(width/2,height/2);
  setSolarSystemRotatio();
  
  ficherogif.setDelay(1);
  ficherogif.addFrame();
}
