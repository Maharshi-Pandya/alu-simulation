class AndChip extends Chip {
  AndChip(float _x, float _y) {
    super(_x, _y);
    chipName = "AND";
    chipColor = andColor;
    
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
}
