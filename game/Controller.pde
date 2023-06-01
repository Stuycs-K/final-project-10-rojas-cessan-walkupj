class Controller {
  static final int P1_LEFT = 0;
  static final int P1_RIGHT = 1;
  static final int P1_UP = 2;
  static final int P1_DOWN = 3;
  static final int SHIFT_KEY = 4;
  boolean [] inputs;

  public Controller() {
    inputs = new boolean[5];//4 valid buttons w a d s
  }

  /**@param code: a valid constant e.g. P1_LEFT
  */
  boolean isPressed(int code) {
    return inputs[code];
  }

  void press(int code) {
    if(code == 'A')
      inputs[P1_LEFT] = true;
    if(code == 'D')
      inputs[P1_RIGHT] = true;
    if(code == 'W')
      inputs[P1_UP] = true;
    if(code == 'S')
      inputs[P1_DOWN] = true;
    if(code == SHIFT)
      inputs[SHIFT_KEY] = true;
  }
  void release(int code) {
    if(code == 'A')
      inputs[P1_LEFT] = false;
    if(code == 'D')
      inputs[P1_RIGHT] = false;
    if(code == 'W')
      inputs[P1_UP] = false;
    if(code == 'S')
      inputs[P1_DOWN] = false;
    if(code == SHIFT)
      inputs[SHIFT_KEY] = true;
  }
}
