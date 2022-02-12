class NotChip extends Chip {
  NotChip(float _x, float _y) {
    super(_x, _y);
    chipName = "NOT";
    chipColor = notColor;
    
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
}
