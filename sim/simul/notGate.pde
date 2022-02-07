class NotChip extends Chip {
  NotChip() {
    super();
    chipName = "NOT";
    
    inputPins = new Pin[1];
    for(int i=0; i<inputPins.length; i++) {
      inputPins[i] = new Pin(width/2 + 30, height/2);
      inputPins[i].pType = PinType.ChipInput;
      inputPins[i].chip = this;
    }
    
    outputPins = new Pin[1];
    for(int i=0; i<outputPins.length; i++) {
      outputPins[i] = new Pin(width/2 + 60, height/2);
      outputPins[i].pType = PinType.ChipOutput;
      outputPins[i].chip = this;
    }
  }
  
  @Override void processOutput() {
    println("In NOT gate...");
    int signal = 1 - inputPins[0].state;
    outputPins[0].recieveSignal(signal);
  }
}
