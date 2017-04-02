

/**
 * By David Steele Overholt
 */
import processing.video.*;

Capture video;

int videoSliceX;
int drawPositionX;
int rNum = 0;


void setup() {
  size(800, 800, P2D);


  
  // Uses the default video input, see the reference if this causes an error
  video = new Capture(this, 320, 240, 30);
  
  videoSliceX = video.width / 2;
  drawPositionX = width;
  background(0);
}


void draw() {
    
  if (video.available()) {
    video.read();
    video.loadPixels();
    
     
     
     
     // Copy a column of pixels from the middle of the video 
    // To a location moving slowly across the canvas.
    loadPixels();
   
     pushMatrix();
    for (int y = 0; y < video.height; y++){
      translate(width/2, height/2); 
     rotate(radians(rNum));
     rNum++;
      int setPixelIndex = y*width + rNum;
      int getPixelIndex = y*video.width  + videoSliceX;
      pixels[setPixelIndex] = video.pixels[getPixelIndex];
    }
    
      popMatrix();  
     //stroke(204, 102, 0);
     //rect(0, 0, 320, 240);
    
    updatePixels();
    
    
    
    drawPositionX--;
    // Wrap the position back to the beginning if necessary.
    if (drawPositionX < 0) {
      delay(1000);
      drawPositionX = width;
    }
  }
  

}





