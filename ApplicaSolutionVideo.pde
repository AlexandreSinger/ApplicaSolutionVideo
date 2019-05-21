// test change for github

Logo logo;
CompanyName name;

void setup() {
  size(1280, 720);
  logo = new Logo(width/2, height/2, width*2/3, "test.png");
  name = new CompanyName("Test Company Name", width/2, height/4, 64);
  logo.preset();
  name.preset();
}

void draw() {
  background(46, 179, 253);

  //if (keyPressed) {
  //  if (key == 's') {
  //    //logo.spinLogo();
  //    logo.angle += 5;
  //  }
  //  if (key == 'z') {
  //    //logo.scaleLogo();
  //    logo.scale += 0.1;
  //  }
  //  if (key == 'f') {
  //    //logo.fadeLogo();
  //    if (logo.transparency > 0) {
  //      logo.transparency -= 4;
  //    }
  //  }
  //  if (key == 'r') {
  //    logo.reset();
  //  }
  //  if (key == 'v') {
  //    if (logo.flipScale > -1) {
  //      logo.flipScale -= 0.1;
  //    }
  //  }
  //}
  
  logo.action1();
  logo.show();
  
  name.action1();
  name.show();
}
