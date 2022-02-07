
// is called before the simulation start
void setup() {
  size(600, 400);
  
  // main board
  BreadBoard board = new BreadBoard();
  
  // create input and output pins
  Pin inpA = board.createGlobalInputPin();
  Pin inpB = board.createGlobalInputPin();

  Pin outA = board.createGlobalOutputPin();

  // add chip(s)
  Chip andChip = board.addChip("AND");
  
  // connect wires
  board.connectWireBetween(inpA, andChip.inputPins[0]);
  board.connectWireBetween(inpB, andChip.inputPins[1]);
  
  board.connectWireBetween(andChip.outputPins[0], outA);
  
  // send signals
  int[] signals = {1, 1};
  board.recieveSignals(signals);
  
  // get outputs
  ArrayList<Integer> states = board.getGlobalOutputStates();
  for(int i=0; i<states.size(); i++) {
    println("State of Output", i+1, ":", states.get(i));
  }
}

// is called per frame
void draw() {
  background(200);
}
