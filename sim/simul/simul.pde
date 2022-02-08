BreadBoard board;
Pin inpA;
Pin inpB;

Pin outA;

Chip andChip, notChip;

// is called before the simulation start
void setup() {
  fullScreen();

  // main board
  board = new BreadBoard();

  // create input and output pins
  inpA = board.createGlobalInputPin(20, height/4);
  inpB = board.createGlobalInputPin(20, 3*height/4);

  outA = board.createGlobalOutputPin(width - 20, height/2);

  // add chip(s)
  andChip = board.addChip("AND", width/2, height/2);
  notChip = board.addChip("NOT", width/2 + 300, height/2);

  // connect wires
  board.connectWireBetween(inpA, andChip.inputPins[0]);
  board.connectWireBetween(inpB, andChip.inputPins[1]);

  board.connectWireBetween(andChip.outputPins[0], notChip.inputPins[0]);
  board.connectWireBetween(notChip.outputPins[0], outA);

  // send signals
  int[] signals = {1, 0};
  board.recieveSignals(signals);

  // get outputs
  ArrayList<Integer> states = board.getGlobalOutputStates();
  for (int i=0; i<states.size(); i++) {
    println("State of Output", i+1, ":", states.get(i));
  }
}

// is called per frame
void draw() {
  background(0x2A0944);

  board.displayState();
}
