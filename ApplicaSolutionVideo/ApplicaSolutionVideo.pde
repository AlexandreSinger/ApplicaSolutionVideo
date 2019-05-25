import com.hamoid.*;            // Reference: https://funprogramming.org/VideoExport-for-Processing/reference/index.html
import processing.video.*;

// constants, changed before program is run
int animationType = 3;
String logoFile = "assets/test.png";
String companyName = "Your Company Name Here";
String fileName = "Option3";    //testVideo

// declarations of the object variables
Image logo;
Text name;
VideoExport videoExport;
Movie template;
PGraphics frame, thumbnail;

// declares the size of each frame as 1280 by 720
int frameWidth = 1280, frameHeight = 720;
int countFrame = 1;

// setup function that will run only once when the program begins
void setup() {
  // declare the logo and name object to appear at the center of the screen and the video exporter
  logo = new Image(logoFile, frameWidth/2, frameHeight/2, frameWidth*2/3);
  name = new Text(companyName, frameWidth/2, frameHeight/4, 64);

  //--------------------------- thumbnail ----------------------------------------------------

  // thumbnail size set to 1280 by 720 because it is the youtube recommended thumbnail size
  thumbnail = createGraphics(1280, 720);
  thumbnail.beginDraw();
  thumbnail.background(46, 179, 253);
  logo.preset(0);
  logo.show(thumbnail);
  thumbnail.endDraw();
  thumbnail.save(fileName + "_thumbnail.png");

  //------------------------------------------------------------------------------------------

  // declares the size of the screen as 1280 by 720
  frame = createGraphics(frameWidth, frameHeight);

  // declare the videoExport tool
  videoExport = new VideoExport(this, fileName + ".mp4", frame);
  videoExport.setFrameRate(30);

  // begin the video exporting process
  videoExport.startMovie();

  //-------------------------------- front end video ----------------------------------

  // preset the animation
  logo.preset(animationType);
  name.preset(animationType);

  // frame by frame animate the front end of the video
  for (int i = 0; i < 80; i++) {
    print("exporting to video: frame " + countFrame + "\n");

    // begin drawing to the frame graphic
    frame.beginDraw();

    // draws a generic blue background
    frame.background(46, 179, 253);

    // make the logo step animations based on the chosen animation type
    logo.animate(animationType);
    name.animate(animationType);

    // in each iteration, show the logo and the name
    logo.show(frame);
    name.show(frame);

    // end the draw on the frame and save each frame to the video
    //frame.endDraw();
    videoExport.saveFrame();
    countFrame++;
  }

  //----------------------------------- transition ---------------------------------

  PImage lastFrame = frame.get();

  PImage blackScreen = createImage(frameWidth, frameHeight, RGB);
  blackScreen.loadPixels();
  for (int i = 0; i < blackScreen.pixels.length; i++) {
    blackScreen.pixels[i] = color(0, 0, 0);
  }
  blackScreen.updatePixels();

  // fade from the last frame to a black screen in 20 frames
  fadeTransition(lastFrame, blackScreen, 40);

  //------------------------------ middle template video ---------------------------

  // open and play the middle template
  template = new Movie(this, "testTemplate.mp4");
  template.noLoop();
  int iTemp = countFrame;
  template.play();

  // wait for the frame count to reach the end of the video
  while (countFrame < iTemp + floor(template.duration()*30)) {
    delay(1000);
  }

  // stop the video
  template.stop();

  //------------------------------ transition ---------------------------------------

  lastFrame = frame.get();

  logo.preset(0);
  name.preset(0);
  frame.beginDraw();
  frame.background(46, 179, 253);
  logo.show(frame);
  name.show(frame);
  frame.endDraw();

  PImage firstFrame = frame.get();

  fadeTransition(lastFrame, firstFrame, 60);

  //------------------------------ back end video -----------------------------------

  // preset the animation
  logo.preset(0);
  name.preset(0);

  // frame by frame animate the front end of the video
  for (int i = 0; i < 60; i++) {
    print("exporting to video: frame " + countFrame + "\n");

    // begin drawing to the frame graphic
    frame.beginDraw();

    // draws a generic blue background
    frame.background(46, 179, 253);

    // make the logo step animations based on the chosen animation type
    //logo.animate(0);
    //name.animate(0);

    // in each iteration, show the logo and the name
    logo.show(frame);
    name.show(frame);

    // end the draw on the frame and save each frame to the video
    frame.endDraw();
    videoExport.saveFrame();
    countFrame++;
  }

  //-----------------------------------------------------------------------------------

  // exports the video to a file, then exits the program
  videoExport.endMovie();
  print("the video contains " + videoExport.getCurrentFrame() + " frames");
  print("\n");
  print("the duration of the video is " + videoExport.getCurrentTime() + " seconds");
  exit();
}

// this movie event will start when a movie is started, and loop everytime a new frame of video is available
void movieEvent(Movie m) {
  print("exporting to video: frame " + countFrame + "\n");
  frame.beginDraw();
  frame.background(46, 179, 253);
  frame.imageMode(CORNER);
  m.read();
  frame.image(m, 0, 0);
  frame.endDraw();
  videoExport.saveFrame();
  countFrame++;
}

// function that fades from one image to another in a certain number of frames
void fadeTransition(PImage frame1, PImage frame2, int frames) {
  for (int i = 1; i <= frames; i++) {
    print("exporting to video: frame " + countFrame + "\n");
    frame.beginDraw();
    frame.imageMode(CORNER);
    frame.tint(255, 255);
    frame.image(frame1, 0, 0);
    frame.tint(255, floor(i*255/frames));
    frame.image(frame2, 0, 0);
    frame.endDraw();
    videoExport.saveFrame();
    countFrame++;
  }
}
