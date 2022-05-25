//Alex Zody's Calculator A3 10/18/21
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal = "0"; //info inside the display
String op = ""; // store operator for calculations
boolean left = true; // used to decide left or right of operator
float r = 0.0; //decimal number right of the operator
float l = 0.0; //decimal number left of the operator
float result = 0.0; // decimal number containing the result of a calculation

void setup() {
  size (190, 260);

  numButtons[0] = new Button(20, 190, 30, 30, "0");
  numButtons[1] = new Button(20, 70, 30, 30, "1");
  numButtons[2] = new Button(50, 70, 30, 30, "2");
  numButtons[3] = new Button(80, 70, 30, 30, "3");

  numButtons[4] = new Button(20, 110, 30, 30, "4");
  numButtons[5] = new Button(50, 110, 30, 30, "5");
  numButtons[6] = new Button(80, 110, 30, 30, "6");

  numButtons[7] = new Button(20, 150, 30, 30, "7");
  numButtons[8] = new Button(50, 150, 30, 30, "8");
  numButtons[9] = new Button(80, 150, 30, 30, "9");

  opButtons[0] = new Button(120, 70, 20, 20, "+");
  opButtons[1] = new Button(120, 100, 20, 20, "-");
  opButtons[2] = new Button(120, 130, 20, 20, "/");
  opButtons[3] = new Button(120, 160, 20, 20, "*");

  opButtons[4] = new Button(100, 225, 70, 30, "=");

  opButtons[5] = new Button(150, 70, 20, 20, ".");
  opButtons[6] = new Button(150, 100, 20, 20, "^2");
  opButtons[7] = new Button(150, 130, 20, 20, "√");
  opButtons[8] = new Button(150, 160, 20, 20, "π");
  opButtons[9] = new Button(150, 190, 20, 20, "±");
  opButtons[11] = new Button(120, 190, 20, 20, "C");
  opButtons[10] = new Button(20, 225, 70, 30, "clear");
}

void draw() {
  background(0, 127, 127);

  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}
void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on && dVal.length()< 15) {
      handleEvent(numButtons[i].val, true);
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].on) {
      handleEvent(opButtons[i].val, false);
    }
  }
  println("L:" + l + "Op:" + op + "R:" + r + "Left:" + left );
}
void clearCalc() {
  dVal = "0";
  op = "";
  left = true;
  r = 0.0;
  l = 0.0;
  result = 0.0;
}

void updateDisplay() {
  fill(0);
  rect(10, 10, 150, 50);
  fill(255);
  textAlign(RIGHT);
  if (dVal.length() < 8) {
    textSize(36);
  } else if (dVal.length() < 10) {
    textSize(32);
  } else {
    textSize(20);
  }
  text(dVal, width-30, 50);
}

void performCalc() {
  if (op.equals("+")) {
    result = l + r;
  } else if (op.equals("-")) {
    result = l-r;
  } else if (op.equals("*")) {
    result = l*r;
  } else if (op.equals("/")) {
    result = l/r;
  }
  // add other logic calculations
  dVal = str(result);
  l = result;
  left = true;
}



void keyPressed() {
  println("key?:" + key);
  println("keyCode:" + keyCode);
  if (keyPressed) {
    if (keyCode == 1) {
      handleEvent("1", true);
    } else if (keyCode == 107) {
      handleEvent("+", false);
    }
  }
}


void handleEvent(String val, boolean num) {
  if (num) {
    //handle all number clicks or keypress
    if (dVal.equals("0")) {
      dVal = val;
      if (left) {
        l = float(dVal);
      } else if (!left) {
        r = float(dVal);
      }
    } else if (dVal.length() < 15) {
      dVal = dVal + val;
      if (left) {
        l = float(dVal);
      } else if (!left) {
        r = float(dVal);
      }
    }
  } else if (val.equals("clear")) {
    //logic for clear button
    clearCalc();
  } else if (val.equals("+")) {
    left = false;
    op = "+";
    dVal = "0";
  } else if (val.equals("=")) {
    performCalc();
  } else if (val.equals("-")) {
    left = false;
    op = "-";
    dVal ="0";
  } else if (val.equals("*")) {
    left = false;
    op = "*";
    dVal ="0";
  } else if (val.equals("/")) {
    left = false;
    op = "/";
    dVal ="0";
  } else if (val.equals("±")) {
    if (left) {
      l = l * -1;
      dVal = str(l);
    } else if (!left) {
      r = r * -1;
      dVal = str(r);
    }
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal = dVal + ".";
    }
  } else if (val.equals("√")) {
    if (left) {
      l =  sqrt(l);
      dVal = str(l);
    } else if (!left) {
      r = sqrt(r);
      dVal = str(r);
    }
  } else if (val.equals("π")) {
    if (left) {
      l =  3.14;
      dVal = str(l);
    } else if (!left) {
      r = 3.14;
      dVal = str(r);
    }
  } else if (val.equals("^2")) {
    if (left) {
      l = sq(l) ;
      dVal = str(l);
    } else if (!left) {
      r = sq(r);
      dVal = str(r);
    }
  } else if (val.equals("C")) {
     if (left) {
      l = cos(radians(l)) ;
      dVal = str(l);
    } else if (!left) {
      r = cos(radians(r));
      dVal = str(r);
    }
  }
}
