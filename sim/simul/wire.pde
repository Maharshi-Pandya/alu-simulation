class Wire {
  Pin start, end;
  
  Wire() {
    start = null;
    end = null;
  }
  
  void setStart(Pin pin) { 
    start = pin;
  }
  
  void setEnd(Pin pin) {
    end = pin;
  }
  
  void connect() {
    start.makeConnection(end);
  }
}
