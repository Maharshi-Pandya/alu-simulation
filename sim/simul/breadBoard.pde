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
  
  ArrayList<Wire> wires;
  
  ArrayList<Integer> boardSignals;

  BreadBoard() {
    inputPins = new ArrayList<Pin>();
    outputPins = new ArrayList<Pin>();
    chips = new ArrayList<Chip>();
    wires = new ArrayList<Wire>();
    boardSignals = new ArrayList<Integer>();
  }

  /*
    Create a new global input Pin and output Pin
  */
  Pin createGlobalInputPin(float _x, float _y) {
    Pin inp = new Pin(_x, _y);
    inputPins.add(inp);
    return getInputPinNum(inputPins.size());
  }
  
  Pin createGlobalOutputPin(float _x, float _y) {
    Pin out = new Pin(_x, _y);
    outputPins.add(out);
    return getOutputPinNum(outputPins.size());
  }
  
  /*
    Add a Chip to the board
  */
  Chip addChip(String chipName, float _x, float _y) {
    Chip chip = null;
    if("AND".equals(chipName)) {
      chip = new AndChip(_x, _y);
      chips.add(chip);
    }
    else if("NOT".equals(chipName)) {
      chip = new NotChip(_x, _y);
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
    wires.add(wire);
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
  void recieveSignals(ArrayList<Integer> signals) {
    //boardSignals.clear();
    if(signals.size() == inputPins.size()) {
      
      // set boardSignals
      if(boardSignals.size() == signals.size()) {
        for(int i=0; i<signals.size(); i++) {
          boardSignals.set(i, signals.get(i));
        }
      }
      else {
        for(int i=0; i<signals.size(); i++) {
          boardSignals.add(signals.get(i));
        }
      }
      
      for(int i=0; i<boardSignals.size(); i++) {
        inputPins.get(i).recieveSignal(boardSignals.get(i));
      }
    }
  }
  
  void updateState(float x, float y) {
    for(int i=0; i<inputPins.size(); i++) {
      
        if(((x >= inputPins.get(i).position.x - pinRadius) && (x <= inputPins.get(i).position.x + pinRadius))
        && ((y >= inputPins.get(i).position.y - pinRadius) && (y <= inputPins.get(i).position.y + pinRadius))) {
          println("Clicked..");
          int signal = inputPins.get(i).toggleState();
          inputPins.get(i).recieveSignal(signal);
        }
      
    }
  }
  
  /*
    Display everything in order
  */
  void displayState() {
    for(Pin inpPin: inputPins) {
      inpPin.display();
    }
    for(Pin outPin: outputPins) {
      outPin.display();
    }
    for(Wire w: wires) {
      w.display();
    }
    for(Chip c: chips) {
      c.display();
    }
  }
}
