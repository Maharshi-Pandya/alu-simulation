class NotChip extends Chip {
  NotChip(float _x, float _y) {
    super(_x, _y);
    chipName = "NOT";
    numInputPins = 1;
    numOutputPins = 1;
    
    inputPins = new ArrayList<Pin> (numInputPins);
    outputPins = new ArrayList<Pin> (numOutputPins);
    
    chipWidthHeight = calculateWidthHeight();
    
    for(int i=0; i<numInputPins; i++) {
      Pin pin = new Pin(chipPos.x, chipPos.y + chipWidthHeight.y/2);
      attachInputPin(pin);
    }
    
    for(int i=0; i<numOutputPins; i++) {
      Pin pin = new Pin(chipPos.x + chipWidthHeight.x, chipPos.y + (chipWidthHeight.y/2));
      attachOutputPin(pin);
    }
  }
  
  @Override void processOutput() {
    println("In NOT gate...");
    int signal = 1 - inputPins.get(0).state;
    outputPins.get(0).recieveSignal(signal);
  }
  
  // display
  void display() {
    noStroke();
    fill(0, 200, 255);
    rect(chipPos.x, chipPos.y, chipWidthHeight.x, chipWidthHeight.y, chipRoundness);
    for(int i=0; i<inputPins.size(); i++) {
      inputPins.get(i).display();
    }
    for(int i=0; i<outputPins.size(); i++) {
      outputPins.get(i).display();
    }
  }
}
