class Logo {
  int x, y, w, h, angle = 0;
  float scale = 1, transparency = 255, flipScale = 1;
  PImage img;

  Logo(int ix, int iy, int iw, String iimg) {
    x = ix;
    y = iy;
    w = iw;
    img = loadImage(iimg);
    img.resize(w, 0);
  }

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

  void preset() {
    flipScale = -1;
    transparency = 0;
    angle = 0;
  }

  void action1() {
    if (transparency <= 255){
      transparency += 4;
    }
    if (flipScale <= 1) {
      flipScale += 0.05;
    }
  }

  void reset() {
    angle = 0;
    transparency = 255;
    scale = 1;
    flipScale = 1;
  }
}
