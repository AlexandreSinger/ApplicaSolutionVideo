// declaration of an object class called Logo that will hold an image
class Image {
  // variables for the object
  int x, y, w, h, angle = 0;
  float scale = 1, transparency = 255, flipScale = 1;
  PImage img;

  // constructor function that initializes the object with it's location, size, and image location
  Image(String iimg, int ix, int iy, int iw) {
    x = ix;
    y = iy;
    w = iw;
    img = loadImage(iimg);
    img.resize(w, 0);
  }

  // function to show the image (allowing for animations to be used
  void show(PGraphics screen) {
    screen.tint(255, transparency);
    screen.imageMode(CENTER);

    screen.pushMatrix();

    screen.translate(x, y);
    screen.scale(flipScale, 1);
    screen.rotate(radians(angle));
    screen.image(img, 0, 0);

    screen.popMatrix();
  }

  // function to preset the animation
  void preset(int type) {
    if (type == 0) {
      transparency = 255;
      flipScale = 1;
      scale = 1;
    } else if (type == 1) {
      flipScale = -1;
      transparency = 0;
      angle = 0;
    }
  }

  // animation function
  void animate(int type) {
    if (type == 1) {
      if (transparency <= 255) {
        transparency += 8;
      }
      if (flipScale <= 1) {
        flipScale += 0.05;
      }
    } else if (type == 2) {
    }
  }
}
