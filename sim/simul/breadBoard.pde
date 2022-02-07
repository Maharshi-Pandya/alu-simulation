class BreadBoard {
  /*
    Bread board is our playground.
    It has the main input and output Pins
  */
  ArrayList<Pin> inputPins, outputPins;
  
  /*
    The chips which are currently on the bread board
  */
  ArrayList<Chip> chips;

  BreadBoard() {
    inputPins = new ArrayList<Pin>();
    outputPins = new ArrayList<Pin>();
    chips = new ArrayList<Chip>();
  }

  /*
    Create a new global input Pin and output Pin
  */
  Pin createGlobalInputPin() {
    Pin inp = new Pin();
    inputPins.add(inp);
    return getInputPinNum(inputPins.size());
  }
  
  Pin createGlobalOutputPin() {
    Pin out = new Pin();
    outputPins.add(out);
    return getOutputPinNum(outputPins.size());
  }
  
  /*
    Add a Chip to the board
  */
  Chip addChip(String chipName) {
    Chip chip = null;
    if("AND".equals(chipName)) {
      chip = new AndChip();
      chips.add(chip);
    }
    else if("NOT".equals(chipName)) {
      chip = new NotChip();
      chips.add(chip);
    }
    
    return chips.get(chips.size() - 1);
  }
  
  /*
    Connect a wire from one Pin to other Pin.
    Here the start of the wire would be pA and the end would be pB.
    So it works when we connect the pins left to right...
  */
  void connectWireBetween(Pin pA, Pin pB) { 
    Wire wire = new Wire();
    wire.setStart(pA);
    wire.setEnd(pB);
    wire.connect();
  }
  
  /*
    Getters for inputPins and outputPins
  */
  Pin getInputPinNum(int index) {
    return inputPins.get(index - 1);
  }
  
  Pin getOutputPinNum(int index) {
    return outputPins.get(index - 1);
  }
  
  /*
    Get the states of all the output Pins
  */
  ArrayList<Integer> getGlobalOutputStates() {
    ArrayList<Integer> outStates = new ArrayList<Integer>();
    
    for(Pin pin : outputPins) {
      outStates.add(pin.state);
    }
    
    return outStates;
  }
  
  /*
    This function recieve signals at the input Pins as an array of ints,
    and thus executes the circuit
  */
  void recieveSignals(int[] signals) {  
    if(signals.length == inputPins.size()) {
      for(int i=0; i<signals.length; i++) {
        inputPins.get(i).recieveSignal(signals[i]);
      }
    }
  }
}
