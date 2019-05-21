// declares a class called CompanyName that will hold a text object
class CompanyName {
  // object variables that the text will use
  int x, y, w, fontSize, tx;
  String name;
  PFont font;

  // constructor function that takes in the name, location, and size of the text
  CompanyName(String iname, int ix, int iy, int isize) {
    x = ix;
    y = iy;
    name = iname;
    fontSize = isize;
    font = createFont("Helvetica-Bold", fontSize);
    tx = x;
  }

  // function that shows the text on the screen
  void show() {
    textAlign(CENTER);
    textSize(fontSize);
    textFont(font);

    text(name, x, y);
  }

  // function that will preset the animation
  void preset() {
    x = 0;
  }

  // animation functions
  void animate(int type) {
    if (type == 1) {
      if (x < tx) {
        x += 14;
      }
    } else if (type == 2) {
    }
  }
}
