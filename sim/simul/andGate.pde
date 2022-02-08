class AndChip extends Chip {
  AndChip(float _x, float _y) {
    super(_x, _y);
    chipName = "AND";
    
    inputPins = new Pin[2];
    
    chipWidthHeight = calculateWidthHeight();
    
    // set inputPins
    for(int i=0; i<inputPins.length; i++) {
      inputPins[i] = new Pin(chipPos.x, chipPos.y + i*(2 * pinRadius + 10));
      inputPins[i].pType = PinType.ChipInput;
      inputPins[i].chip = this;
    }
    
    outputPins = new Pin[1];
    // set outputPins
    for(int i=0; i<outputPins.length; i++) {
      outputPins[i] = new Pin(chipPos.x + 50, chipPos.y + (chipWidthHeight.y/2));
      outputPins[i].pType = PinType.ChipOutput;
      outputPins[i].chip = this;
    }
    
    
  }

  // ez
  @Override void processOutput() {
    println("In AND gate...");
    int signal = inputPins[0].state & inputPins[1].state;
    outputPins[0].recieveSignal(signal);
  }
  
  // display
  void display() {
    noStroke();
    fill(244, 0, 0);
    rect(chipPos.x, chipPos.y, chipWidthHeight.x, chipWidthHeight.y);
    for(int i=0; i<inputPins.length; i++) {
      inputPins[i].display();
    }
    for(int i=0; i<outputPins.length; i++) {
      outputPins[i].display();
    }
  }
}
