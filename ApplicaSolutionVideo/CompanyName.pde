// declares a class called CompanyName that will hold a text object
class Text {
  // object variables that the text will use
  int x, y, w, fontSize, tx, ty;
  float transparency = 255, flipScale = 1;
  String name;
  PFont font;
  boolean isFinished;

  // constructor function that takes in the name, location, and size of the text
  Text(String iname, int ix, int iy, int isize) {
    x = ix;
    y = iy;
    name = iname;
    fontSize = isize;
    font = createFont("Helvetica-Bold", fontSize);
    tx = x;
    ty = y;
    isFinished = false;
  }

  // function that shows the text on a PGraphic
  void show(PGraphics screen) {
    screen.textAlign(CENTER);
    screen.textSize(fontSize);
    screen.textFont(font);
    screen.fill(255, 255, 255, transparency);
    
    screen.pushMatrix();
    screen.translate(x,y);
    screen.scale(flipScale, 1);
    screen.text(name, 0, 0);
    screen.popMatrix();
  }

  // function that will preset the animation
  void preset(int type) {
    if (type == 0) {
      transparency = 255;
      flipScale = 1;
      x = tx;
    } else if (type == 1) {
      x = 0;
    } else if (type == 2) {
      y += frameHeight;
    } else if (type == 3) {
      transparency = 0;
    }
  }

  // animation functions
  void animate(int type) {
    if (type == 1) {
      if (x < tx) {
        x += 14;
      } else {
        isFinished = true;
      }
    } else if (type == 2) {
      if (y > ty) {
        y -= 12;
      }
    } else if (type == 3) {
      if (transparency < 255) {
        transparency += 8;
      }
    }
  }
}
