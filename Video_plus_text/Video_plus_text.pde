PFont f;
// Step 1. Import the video library
import processing.video.*;

// Step 2. Declare a Capture object
Capture video;

void setup() {  
  size(640, 480);  
  
  f = createFont("Georgia", 24);
  textFont(f);
  
  // Step 3. Initialize Capture object via Constructor
  video = new Capture(this, 640, 480);  
  video.start();
}
  
// An event for when a new frame is available
void captureEvent(Capture video) {  
  // Step 4. Read the image from the camera.  
  video.read();
}
void draw() {
  loadPixels();
  video.loadPixels();  

  for (int x = 0; x < video.width; x++) {    
    for (int y = 0; y < video.height; y++) {      
      // Calculate the 1D location from a 2D grid
      int loc = x + y * video.width;      
    
      // Get the red, green, blue values from a pixel      
      float r = red  (video.pixels[loc]);      
      float g = green(video.pixels[loc]);      
      float b = blue (video.pixels[loc]);      
      
      // Make a new color and set pixel in the window      
      color c = color(r, g, b);      
      pixels[loc] = c;    
    }  
  }  
  
  updatePixels();
  text("Woorden worden zinnen", 120, 240);
}
