class Button {
  // Member Variables
  float x, y, w, h;
  boolean on;
  String val;
  // Constructor
  Button(float tempX, float tempY, float tempW, float tempH, String tempVal) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    val = tempVal;
    on = false;
  }
  // Method for Display
  void  display() {
    if (on) {
      fill(128);
    } else {
      fill(222);
    }
    rect(x, y, w, h, 5);
    fill(0);
    //textAlign();
    textSize(15);
    textAlign(LEFT);
    text(val,x+6,y+16);
  }
  // Method to detect hovering / mouseover
  void hover(int mx, int my) {
    on = (mx>x && mx<x+w && my>y && my<y+h);
  }
  
  
  
  
  
}
