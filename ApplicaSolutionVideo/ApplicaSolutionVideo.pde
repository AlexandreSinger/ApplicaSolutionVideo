import com.hamoid.*;

// constants, changed before program is run
int animationType = 1;
String logoFile = "assets/test.png";
String companyName = "Your Company Name Here";
String fileName = "testVideo.mp4";

// declarations of the company name and logo objects
Logo logo;
CompanyName name;

VideoExport videoExport;
PGraphics frame;

// setup function that will run only once when the program begins
void setup() {
  // declares the size of the screen as 1280 by 720 and the framerate as 30 fps
  size(1280, 720);
  frame = createGraphics(width, height);
  frameRate(30);

  // declare the logo and name object to appear at the center of the screen
  logo = new Logo(width/2, height/2, width*2/3, logoFile);
  name = new CompanyName(companyName, width/2, height/4, 64);
  
  videoExport = new VideoExport(this, fileName, frame);

  // preset the animation
  logo.preset();
  name.preset();
  
  videoExport.startMovie();
}

// function that runs an infinite loop after the setup function runs
void draw() {
  print("exporting video" + frameCount + "\n");
  
  frame.beginDraw();
  // draws a generic blue background
  frame.background(46, 179, 253);

  // make the logo step animations based on the chosen animation type
  logo.animate(animationType);
  name.animate(animationType);

  // in each iteration, show the logo and the name
  logo.show();
  name.show();
  
  // save each frame of animation
  //saveFrame("frames/####.png");
  frame.endDraw();
  videoExport.saveFrame();
  
  // leaves the program if the animation is finished
  if (name.isFinished) {
    videoExport.endMovie();
    exit();
  }
}
