// declares a class called CompanyName that will hold a text object
class Text {
  // object variables that the text will use
  int x, y, w, fontSize, tx;
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
    isFinished = false;
  }

  // function that shows the text on the screen
  void show(PGraphics screen) {
    screen.textAlign(CENTER);
    screen.textSize(fontSize);
    screen.textFont(font);
    screen.text(name, x, y);
  }

  // function that will preset the animation
  void preset(int type) {
    if (type == 0) {
      x = tx;
    } else if (type == 1) {
      x = 0;
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
    }
  }
}
