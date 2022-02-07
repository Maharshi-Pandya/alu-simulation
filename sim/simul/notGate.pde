class NotChip extends Chip {
  NotChip() {
    super();
    chipName = "NOT";
    
    inputPins = new Pin[1];
    for(int i=0; i<inputPins.length; i++) {
      inputPins[i] = new Pin();
      inputPins[i].pType = PinType.ChipInput;
      inputPins[i].chip = this;
    }
    
    outputPins = new Pin[1];
    for(int i=0; i<outputPins.length; i++) {
      outputPins[i] = new Pin();
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
