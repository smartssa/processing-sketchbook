import processing.video.*;

Capture cam;
PImage  frame;
int displayWidth = 1280;
int displayHeight = 760;
int pixelSize = 15;


float x;
float y;
int px;
int py; 
int s;       
color c; 

void setup()
{
  size(displayWidth, displayHeight);
  background(0);
  frameRate(120);
 
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(i);
      println(cameras[i]);
    }
  }      
  
  // turn on the camera 
  // captureEvent will be called every time the webcam returns a new image.
  cam = new Capture(this, cameras[15]);
  cam.start();

  // create a holder for our webcam frame.
  frame = createImage(displayWidth,displayHeight,RGB);
  
  noStroke();

  // fire off the self contained image processing thread.
  thread("setCircle");
 
}

void draw()
{
  // Draw? what draw?
}

void captureEvent(Capture c) {
  
  if (c.available() == true) 
   {
       c.read();
       // shove the cam image into our image bucket.
       frame.copy(c,0,0,displayWidth,displayHeight,0,0,displayWidth,displayHeight);
   }

}

void setCircle()
{
   if (frame.pixels.length > 0) {
     // to infinity and beyond!
     while (true) 
     {
       x = random(displayWidth);
       y = random(displayHeight);
       px = int(x);
       py = int(y); 
       s = int(random(pixelSize));
       c = frame.get(px, py);
       fill(c, 128);
       ellipse(px, py, s, s);
     }
   } 
}
