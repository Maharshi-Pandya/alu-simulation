class Chip {
  protected Pin[] inputPins, outputPins;
  protected String chipName;
  
  protected int inputRecievedSignals;
  
  Chip() {
    inputRecievedSignals = 0;
  }
  
  /*
    When an input signal is recieved, increment the count of recieved signals.
    If all signals are recieved, process the output of all the inputs
  */
  void recieveInputSignal() {
    inputRecievedSignals++;
    if(inputRecievedSignals == inputPins.length) {
      processOutput();
    }
  }
  
  // to be overriden
  void processOutput() {
    
  }
  
  /*
    How the chip is to be displayed
    ----O| |
         | |O-----
    ----O| | 
  */
  void display() { 
  }
}
