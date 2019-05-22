// declaration of an object class called Logo that will hold an image
class Logo {
  // variables for the object
  int x, y, w, h, angle = 0;
  float scale = 1, transparency = 255, flipScale = 1;
  PImage img;

  // constructor function that initializes the object with it's location, size, and image location
  Logo(int ix, int iy, int iw, String iimg) {
    x = ix;
    y = iy;
    w = iw;
    img = loadImage(iimg);
    img.resize(w, 0);
  }

  // function to show the image (allowing for animations to be used
  void show() {
    tint(255, transparency);
    imageMode(CENTER);

    pushMatrix();

    translate(x, y);
    //scale(scale);
    scale(flipScale, 1);
    rotate(radians(angle));
    image(img, 0, 0);

    popMatrix();
  }

  // function to preset the animation
  void preset() {
    flipScale = -1;
    transparency = 0;
    angle = 0;
  }

  // animation function
  void animate(int type) {
    if (type == 1) {
      if (transparency <= 255) {
        transparency += 4;
      }
      if (flipScale <= 1) {
        flipScale += 0.05;
      }
    } else if (type == 2) {
    }
  }

  // reset function to reset the animation
  void reset() {
    angle = 0;
    transparency = 255;
    scale = 1;
    flipScale = 1;
  }
}
