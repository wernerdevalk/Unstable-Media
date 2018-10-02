boolean active=false;
int ctime;
int stopTime;
 
void setup() {
  size(400, 600);
  fill(255);
  textAlign(CENTER, CENTER);
}
 
void draw() {
  background(0);
 
  if (active==true) {
    text("Time passing: " + (millis()-ctime) +" msecs", width/2, height/2);
  } else {
    text("Time passing: " + (stopTime-ctime) +" msecs", width/2, height/2);
  }
 
  text("INSTRUCTIONS: key to start, mouse to stop",width/2,height*0.75);
}
 
void mousePressed() {
  active=true;
  ctime=millis();
  stopTime=0;
}
 
void mouseReleased() {
 
  if (active==true) {
    active=false;
    stopTime=millis();
  }
}
