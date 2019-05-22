// constants, changed before program is run
int animationType = 1;
String logoFile = "assets/test.png";
String companyName = "Your Company Name Here";

// declarations of the company name and logo objects
Logo logo;
CompanyName name;

// setup function that will run only once when the program begins
void setup() {
  // declares the size of the screen as 1280 by 720 and the framerate as 30 fps
  size(1280, 720);
  frameRate(30);

  // declare the logo and name object to appear at the center of the screen
  logo = new Logo(width/2, height/2, width*2/3, logoFile);
  name = new CompanyName(companyName, width/2, height/4, 64);

  // preset the animation
  logo.preset();
  name.preset();
}

// function that runs an infinite loop after the setup function runs
void draw() {
  // draws a generic blue background
  background(46, 179, 253);

  // make the logo step animations based on the chosen animation type
  logo.animate(animationType);
  name.animate(animationType);

  // in each iteration, show the logo and the name
  logo.show();
  name.show();
  
  // save each frame of animation
  saveFrame("frames/####.png");
  
  // leaves the program if the animation is finished
  if (name.isFinished) {
    exit();
  }
}
