float gapBetweenPins = 50;
float chipRoundness = 10;

class Chip {
  protected ArrayList<Pin> inputPins, outputPins;
  protected String chipName;
  protected int numInputPins, numOutputPins;

  protected int inputRecievedSignals;

  protected PVector chipWidthHeight;

  protected PVector chipPos;

  Chip(float _x, float _y) {
    chipPos = new PVector(_x, _y);
    inputRecievedSignals = 0;
  }
  
  void attachInputPin(Pin pin) {
    pin.pType = PinType.ChipInput;
    pin.chip = this;
    inputPins.add(pin);
  }
  
  void attachOutputPin(Pin pin) {
    pin.pType = PinType.ChipOutput;
    pin.chip = this;
    outputPins.add(pin);
  }

  /*
    When an input signal is recieved, increment the count of recieved signals.
   If all signals are recieved, process the output of all the inputs
   */
  void recieveInputSignal() {
    inputRecievedSignals++;
    if (inputRecievedSignals >= inputPins.size()) {
      processOutput();
    }
  }
  
  // calculate display size, based on number of input Pins
  PVector calculateWidthHeight() {
    float chipHeight = numInputPins * pinRadius + gapBetweenPins;
    float chipWidth = 100;

    return new PVector(chipWidth, chipHeight);
  }

  void updatePosition(float x, float y) {
    chipPos.x = x;
    chipPos.y = y;
    for (int i=0; i<inputPins.size(); i++) {
      inputPins.get(i).updatePosition(chipPos.x, chipPos.y + i*(2 * pinRadius + gapBetweenPins));
    }
    for (int i=0; i<outputPins.size(); i++) {
      outputPins.get(i).updatePosition(chipPos.x + chipWidthHeight.x, chipPos.y + i*(2 * pinRadius + gapBetweenPins));
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
