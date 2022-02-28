import peasy.*;

PeasyCam camera;

void initCamera(){
  //The radius of a sphere that has the appropiate radius to fit the screen
  //double radius = sqrt(sq(width/2) + sq(height/2));
  camera = new PeasyCam(this, width/2, height/2, 0, 1000);
  camera.setMaximumDistance(12000);
  camera.setMinimumDistance(1000);
  stopCamera();
}

void stopCamera(){
  camera.reset();
  camera.setActive(false);
}

void playCamera(){
  camera.setDistance(1500);
  camera.setActive(true);
}

void startHUD(){
  if(camera != null){
    camera.beginHUD();
  }
}

void endHUD(){
  if(camera != null){
    camera.endHUD();
  }
}
