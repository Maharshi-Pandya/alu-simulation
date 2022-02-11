class AndChip extends Chip {
  AndChip(float _x, float _y) {
    super(_x, _y);
    chipName = "AND";
    
    // set the number of input and output pins required
    numInputPins = 2;
    numOutputPins = 1;
    
    inputPins = new ArrayList<Pin> (numInputPins);
    outputPins = new ArrayList<Pin> (numOutputPins);
    
    chipWidthHeight = calculateWidthHeight();
    
    // set inputPins
    for(int i=0; i<numInputPins; i++) {
      Pin pin = new Pin(chipPos.x, chipPos.y + i*(2 * pinRadius + gapBetweenPins));
      attachInputPin(pin);
    }

    // set outputPins
    for(int i=0; i<numOutputPins; i++) {
      Pin pin = new Pin(chipPos.x + chipWidthHeight.x, chipPos.y + (chipWidthHeight.y/2));
      attachOutputPin(pin);
    }
  }

  // ez
  @Override void processOutput() {
    println("In AND gate...");
    int signal = inputPins.get(0).state & inputPins.get(1).state;
    outputPins.get(0).recieveSignal(signal);
  }
  
  // display
  void display() {
    noStroke();
    fill(47, 58, 143);
    rect(chipPos.x, chipPos.y, chipWidthHeight.x, chipWidthHeight.y, chipRoundness);
    for(int i=0; i<inputPins.size(); i++) {
      inputPins.get(i).display();
    }
    for(int i=0; i<outputPins.size(); i++) {
      outputPins.get(i).display();
    }
  }
}
