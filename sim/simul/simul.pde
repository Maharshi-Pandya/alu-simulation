BreadBoard board;

// is called before the simulation start
void setup() {
  fullScreen();

  // main board
  board = new BreadBoard();

  // create input and output pins
  Pin inpA = board.createGlobalInputPin(20, height/4);
  Pin inpB = board.createGlobalInputPin(20, 3*height/4);

  Pin outA = board.createGlobalOutputPin(width - 20, height/2);

  // add chip(s)
  Chip andChip = board.addChip("AND", width/2, height/2);
  Chip notChip = board.addChip("NOT", width/2 + 300, height/2);

  // connect wires
  board.connectWireBetween(inpA, andChip.inputPins.get(0));
  board.connectWireBetween(inpB, andChip.inputPins.get(1));

  board.connectWireBetween(andChip.outputPins.get(0), notChip.inputPins.get(0));
  board.connectWireBetween(notChip.outputPins.get(0), outA);

  // send signals
  ArrayList<Integer> signals = new ArrayList<Integer> ();
  signals.add(1);
  signals.add(0);
  board.recieveSignals(signals);

  // get outputs
  ArrayList<Integer> states = board.getGlobalOutputStates();
  for (int i=0; i<states.size(); i++) {
    println("State of Output", i+1, ":", states.get(i));
  }
}

void mouseReleased() {
  board.updateState(mouseX, mouseY);
}

void keyPressed() {
  // Press i or I to enter the input signal mode, where we can toggle the input switches on or off
  if(key == 'i' || key == 'I') { 
    board.inputSignalMode = !board.inputSignalMode;
  }
}

// is called per frame
void draw() {
  background(bgColor);
  board.displayState();
}
