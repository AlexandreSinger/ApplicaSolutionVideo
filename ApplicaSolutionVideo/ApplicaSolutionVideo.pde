import com.hamoid.*;
import processing.video.*;

// constants, changed before program is run
int animationType = 1;
String logoFile = "assets/test.png";
String companyName = "Your Company Name Here";
String fileName = "testVideo.mp4";

// declarations of the object variables
Image logo;
Text name;
VideoExport videoExport;
Movie template;
PGraphics frame;

// declares the size of each frame as 1280 by 720
int frameWidth = 1280, frameHeight = 720;

//void movieEvent(Movie m) {
//  m.read();
//}

int countFrame = 1;



// setup function that will run only once when the program begins
void setup() {
  // declares the size of the screen as 1280 by 720
  frame = createGraphics(frameWidth, frameHeight);

  // declare the videoExport tool
  videoExport = new VideoExport(this, fileName, frame);

  // begin the video exporting process
  videoExport.startMovie();

  //-------------------------------- front end video ----------------------------------

  // declare the logo and name object to appear at the center of the screen and the video exporter
  logo = new Image(frameWidth/2, frameHeight/2, frameWidth*2/3, logoFile);
  name = new Text(companyName, frameWidth/2, frameHeight/4, 64);

  // preset the animation
  logo.preset();
  name.preset();

  // frame by frame animate the front end of the video
  while (countFrame <= 60) {
    print("exporting to video: frame " + countFrame + "\n");

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
    //frame.endDraw();
    videoExport.saveFrame();
    countFrame++;
  }

  //------------------------------ middle template video ---------------------------
  
  // open and play the middle template
  template = new Movie(this, "testTemplate.mp4");
  template.play();
  
  // wait for the frame count to reach the end of the video
  while (countFrame <= 120) {
    delay(1);
  }
  
  // stop the video
  template.stop();


  //------------------------------ back end video -----------------------------------

  // preset the animation
  logo.preset();
  name.preset();

  // frame by frame animate the front end of the video
  while (countFrame <= 180) {
    print("exporting to video: frame " + countFrame + "\n");

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
    //frame.endDraw();
    videoExport.saveFrame();
    countFrame++;
  }

  //-----------------------------------------------------------------------------------

  // exports the video to a file, then exits the program
  videoExport.endMovie();
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
