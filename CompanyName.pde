class CompanyName{
  int x, y, w, fontSize, tx;
  String name;
  PFont font;
  
  CompanyName(String iname, int ix, int iy, int isize){
    x = ix;
    y = iy;
    name = iname;
    fontSize = isize;
    font = createFont("Helvetica-Bold", fontSize);
    tx = x;
  }
  
  void show() {
    textAlign(CENTER);
    textSize(fontSize);
    textFont(font);
    
    text(name, x, y);
  }
  
  void preset() {
    x = 0;
  }
  
  void action1() {
    if (x < tx){
      x += 10;
    }
  }
}
