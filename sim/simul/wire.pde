class Wire {
  /*
    Which Pins does this Wire connect
  */
  Pin start, end;
  
  Wire() {
    start = null;
    end = null;
  }
  
  // setters
  void setStart(Pin pin) { 
    start = pin;
  }
  
  void setEnd(Pin pin) {
    end = pin;
  }
  
  /*
    Call make connection for Pins.
    Left to right is better...
  */
  void connect() {
    start.makeConnection(end);
  }
  
  /*
    How the wire will be displayed
  */
  void display() {
    stroke(255);
    line(start.position.x, start.position.y, end.position.x, end.position.y);
  }
}
