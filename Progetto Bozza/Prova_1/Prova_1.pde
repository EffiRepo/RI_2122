/**
 * Perspective. 
 * 
 * Move the mouse left and right to change the field of view (fov).
 * Click to modify the aspect ratio. The perspective() function
 * sets a perspective projection applying foreshortening, making 
 * distant objects appear smaller than closer ones. The parameters 
 * define a viewing volume with the shape of truncated pyramid. 
 * Objects near to the front of the volume appear their actual size, 
 * while farther objects appear smaller. This projection simulates 
 * the perspective of the world more accurately than orthographic projection. 
 * The version of perspective without parameters sets the default 
 * perspective and the version with four parameters allows the programmer 
 * to set the area precisely.
 */
float beta = 255;

void setup() {
  size(800, 800, P3D);
  stroke(1);
}

void draw() {
  lights();
  background(0);
  float cameraY = height/2.0;
  float fov = 800/float(width) * PI/2;
  float cameraZ = cameraY / tan(fov / 2.0);
  float aspect = float(width)/float(height);
  if (mousePressed) {
    aspect = aspect / 2.0;
  }
  drawAxes();
  //camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0-100, 0, 0, 0, 1);
 //perspective(fov, aspect, cameraZ/10.0, cameraZ*10.0);
  translate(width/2,height/2,-200);
  fill(255);
  sphere(10);
  drawAxes();
  /*rotateZ(-PI/2);
  rotateX(PI/6);
  //translate(width/2,height/2+100, 0);
  fill(0,0,255);
  box(10,400,500);
  pushMatrix();
  translate(195,-200,0);
  fill(255,0,0);
  box(400,10,500);
  popMatrix();
  pushMatrix();
  translate(200,0,-250);
  fill(0,255,0);
  box(400,400,10);
  popMatrix();*/
  
 
  
}
void drawAxes(){
  stroke(255, 0, 0, beta);
  pushMatrix();
  translate(200,0,0);
  fill(255, 0, 0, beta);
  text("X",0,15,0);
  popMatrix();
  line(0, 0, 0, 200, 0, 0);
  stroke(0, 255, 0, beta);
  pushMatrix();
  translate(0,-350,0);
  fill(0, 255, 0, beta);
  text("Z",10,0,0);
  popMatrix();
  line(0, 0, 0, 0, -350, 0);  
  stroke(0, 0, 255, beta);
  pushMatrix();
  translate(0,0,200);
  fill(0, 0, 255, beta);
  text("Y",-15,0,0);
  popMatrix();
  line(0, 0, 0, 0, 0, 200);
}
