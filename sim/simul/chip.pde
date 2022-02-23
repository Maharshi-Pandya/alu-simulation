float gapBetweenPins = 30;
float chipRoundness = 10;

class Chip {
  protected ArrayList<Pin> inputPins, outputPins;
  protected String chipName;
  protected int numInputPins, numOutputPins;

  protected int inputRecievedSignals;

  protected PVector chipWidthHeight;

  protected PVector chipPos;
  protected color chipColor;

  protected boolean chipLocked, over;    // is the mouse over the chip or is the chip locked?

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

  void checkOver(float mx, float my) {
    if ((mx >= chipPos.x && mx <= chipPos.x + chipWidthHeight.x) &&
      (my >= chipPos.y && my <= chipPos.y + chipWidthHeight.y)) {
      over = true;
    } else {
      over = false;
    }
  }

  void checkPressed() {
    if (over) {
      chipLocked = true;
    } else {
      chipLocked = false;
    }
  }

  void releaseEvent() {
    chipLocked = false;
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
    
    if(inputPins.size() == 1) {
      inputPins.get(0).updatePosition(chipPos.x, chipPos.y + (chipWidthHeight.y/2));
    } else {
      for (int i=0; i<inputPins.size(); i++) {
        inputPins.get(i).updatePosition(chipPos.x, chipPos.y + i*(2 * pinRadius + gapBetweenPins));
      }
    }
    
    if(outputPins.size() == 1) {
      outputPins.get(0).updatePosition(chipPos.x + chipWidthHeight.x, chipPos.y + (chipWidthHeight.y/2));
    } else {
      for (int i=0; i<outputPins.size(); i++) {
        outputPins.get(i).updatePosition(chipPos.x + chipWidthHeight.x, chipPos.y + i*(2 * pinRadius + gapBetweenPins));
      }
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
    if (over) {
      stroke(255);
    } else {
      noStroke();
    }

    fill(chipColor);
    rect(chipPos.x, chipPos.y, chipWidthHeight.x, chipWidthHeight.y, chipRoundness);
    for (int i=0; i<inputPins.size(); i++) {
      inputPins.get(i).display();
    }
    for (int i=0; i<outputPins.size(); i++) {
      outputPins.get(i).display();
    }
  }
}
