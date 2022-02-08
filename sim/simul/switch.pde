float pinRadius = 20;

enum PinType {
  ChipInput,
  ChipOutput
};

class Pin {
  PVector position;
  /*
    The type of Pin.
    ChipInput, ChipOutput are two types of pins for chips.
    If its neither of those we know, its either global input Pins or global output Pins
  */
  public PinType pType;
  
  /*
    The state of the pin:
    0 for LOW
    1 for HIGH
  */
  int state;
  
  /*
    The chip this pin is associated to
  */
  Chip chip;
  
  /*
    parentPin : The Pin whose output is connected to this Pin
    childPins : The Pins which are connected to the output of this Pin
  */
  Pin parentPin;
  ArrayList<Pin> childPins;
  
  int pinDisplayColor;
  
  Pin(float _x, float _y) {
    state = 0;
    pType = null;
    parentPin = null;
    chip = null;
    childPins = new ArrayList<Pin>();
    
    position = new PVector(_x, _y);
  }
  
  /*
    Every Pin has a recieveInputSignal which sets the current state of the Pin,
    if the type of this Pin is chipInput, it calls the recieveSignal function of
    the associated chip.
    Else, it forwards the signal to its child Pins.
  */
  void recieveSignal(int signal) {
    this.state = signal;
    
    if(this.pType == PinType.ChipInput) {
      this.chip.recieveInputSignal();
    }
    else if(this.pType == PinType.ChipOutput || (this.pType == null && this.childPins.size() > 0)) {
      for(Pin pin : childPins) {
        pin.recieveSignal(signal);
      }
    }
  }
  
  /*
    Check if a connection is valid
    It is valid if both the pins have different pinTypes.
    Output of one is connected to input of other.
  */
  boolean isValidConnection(Pin otherPin) {
    return (this.pType != otherPin.pType);
  }
  
  /*
    Function to make connection between two Pins.
    The connection is only made if the Pins have different types.
    If its a valid connection, then it is added to the childPins of current Pin.
  */
  void makeConnection(Pin otherPin) { 
    if(isValidConnection(otherPin)) {
      this.childPins.add(otherPin);
      otherPin.parentPin = this;
    }
  }
  
  /*
    How the Pin would be displayed
  */
  void display() {
    if (state == 1) {
      fill(255, 255, 0);
    } else {
      fill(255);
    }
    ellipse(position.x, position.y, 24, 24);
  }
}
