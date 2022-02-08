class Chip {
  protected Pin[] inputPins, outputPins;
  protected String chipName;
  
  protected int inputRecievedSignals;
  
  protected PVector chipWidthHeight;
  
  protected PVector chipPos;
  
  Chip(float _x, float _y) {
    chipPos = new PVector(_x, _y);
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
  
  // calculate display size, based on number of input Pins
  PVector calculateWidthHeight() {
    float chipHeight = inputPins.length * pinRadius + 6;
    float chipWidth = 50;
    
    return new PVector(chipWidth, chipHeight);
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
