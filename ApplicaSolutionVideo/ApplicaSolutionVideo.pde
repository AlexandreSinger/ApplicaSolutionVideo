import com.hamoid.*;

// constants, changed before program is run
int animationType = 1;
String logoFile = "assets/test.png";
String companyName = "Your Company Name Here";
String fileName = "testVideo.mp4";

// declarations of the object variables
Logo logo;
CompanyName name;
VideoExport videoExport;
PGraphics frame;

// setup function that will run only once when the program begins
void setup() {
  // declares the size of the screen as 1280 by 720
  size(1280, 720);
  frame = createGraphics(1280, 720);

  // declare the logo and name object to appear at the center of the screen and the video exporter
  logo = new Logo(width/2, height/2, width*2/3, logoFile);
  name = new CompanyName(companyName, width/2, height/4, 64);
  videoExport = new VideoExport(this, fileName, frame);

  // preset the animation
  logo.preset();
  name.preset();
  
  // begin the video exporting process
  videoExport.startMovie();
}

// function that runs an infinite loop after the setup function runs
void draw() {
  print("exporting to video: frame " + frameCount + "\n");
  
  // begin drawing to the frame graphic
  frame.beginDraw();
  
  // draws a generic blue background
  frame.background(46, 179, 253);

  // make the logo step animations based on the chosen animation type
  logo.animate(animationType);
  name.animate(animationType);

  // in each iteration, show the logo and the name
  logo.show();
  name.show();
  
  // end the draw on the frame and save each frame to the video
  frame.endDraw();
  videoExport.saveFrame();
  
  // exports the video to a file, the exits the program
  if (name.isFinished) {
    videoExport.endMovie();
    exit();
  }
}
