
// is called before the simulation start
void setup() {
  size(600, 400);
  Pin gi1 = new Pin();
  Pin gi2 = new Pin();
  Pin go1 = new Pin();
  
  Chip andgate = new AndChip();
  
  Wire w1 = new Wire();
  w1.setStart(gi1);
  w1.setEnd(andgate.inputPins[0]);
  w1.connect();

  Wire w2 = new Wire();
  w2.setStart(gi2);
  w2.setEnd(andgate.inputPins[1]);
  w2.connect();
  
  Chip notgate = new NotChip();
  
  Wire w3 = new Wire();
  w3.setStart(andgate.outputPins[0]);
  w3.setEnd(notgate.inputPins[0]);
  w3.connect();
  
  Wire w4 = new Wire();
  w4.setStart(notgate.outputPins[0]);
  w4.setEnd(go1);
  w4.connect();
  
  gi1.recieveSignal(0);
  gi2.recieveSignal(0);
  
  println(go1.state);
}

// is called per frame
void draw() {
  background(200);
}
