class AndChip extends Chip {
  AndChip() {
    super();
    chipName = "AND";
    
    inputPins = new Pin[2];
    // set inputPins
    for(int i=0; i<inputPins.length; i++) {
      inputPins[i] = new Pin(width/2, height/2 + i*10);
      inputPins[i].pType = PinType.ChipInput;
      inputPins[i].chip = this;
    }
    
    outputPins = new Pin[1];
    // set outputPins
    for(int i=0; i<outputPins.length; i++) {
      outputPins[i] = new Pin(width/2 + i*10, height/2);
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
}
