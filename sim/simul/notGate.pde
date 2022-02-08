class NotChip extends Chip {
  NotChip(float _x, float _y) {
    super(_x, _y);
    chipName = "NOT";
    
    inputPins = new Pin[1];
    chipWidthHeight = calculateWidthHeight();
    
    for(int i=0; i<inputPins.length; i++) {
      inputPins[i] = new Pin(chipPos.x, chipPos.y + chipWidthHeight.y/2);
      inputPins[i].pType = PinType.ChipInput;
      inputPins[i].chip = this;
    }
    
    outputPins = new Pin[1];
    for(int i=0; i<outputPins.length; i++) {
      outputPins[i] = new Pin(chipPos.x + 50, chipPos.y + (chipWidthHeight.y/2));
      outputPins[i].pType = PinType.ChipOutput;
      outputPins[i].chip = this;
    }
  }
  
  @Override void processOutput() {
    println("In NOT gate...");
    int signal = 1 - inputPins[0].state;
    outputPins[0].recieveSignal(signal);
  }
  
  // display
  void display() {
    noStroke();
    fill(0, 255, 255);
    rect(chipPos.x, chipPos.y, chipWidthHeight.x, chipWidthHeight.y);
    for(int i=0; i<inputPins.length; i++) {
      inputPins[i].display();
    }
    for(int i=0; i<outputPins.length; i++) {
      outputPins[i].display();
    }
  }
}
