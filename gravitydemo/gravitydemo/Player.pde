public class Player {
  float w, h, x, y, vx, vy, accX, accY, speedLimit;
  float gravity, bounce, friction;
  boolean isOnGround;
  float jumpForce;

  float hw, hh;
  String plat;

  public Player() {
    w = 100;
    h = 65;
    x = 400;
    y = 150;
    vx = 0;
    vy = 0;
    accX = 0;
    accY = 0;
    speedLimit = 10;
    isOnGround = false;
    jumpForce = -10;

    friction = 0.96;
    gravity = 0.3;
    bounce = 0;

    hw = w/2;
    hh = h/2;
    plat = "";
  }
  void update() {
    if (left && !right) {
      accX = -0.2;
      friction = 1;
    }
    if (!left && right) {
      accX = 0.2;
      friction = 1;
    }
    if (!left && !right) accX = 0;
    if (up && !down) {
      accY = -0.2;
      gravity = 0;
      friction = 1;
    }
    if (!up && down) {
      accY = 0.2;
      friction = 1;
    }
    if (!up && !down) accY = 0;
    if (!up && !down && !left && !right) {
      friction = 0.96;
      gravity = 0.3;
    }

    vx += accX;
    vy += accY;
    vx *= friction;
    vx *= friction;
    vy += gravity;
    x+= vx;
    y+= vy;
    checkBoundaries();
  }

  void checkBoundaries() {
    if (x< 0) {
      vx *= bounce;
      x =0;
    }
    if (x + w > width) {
      vx *= bounce;
      x = width - w;
    }
    if (y< 0) {
      vy *= bounce;
      y =0;
    }
    if (y + h > height) {
      vy *= bounce;
      y = height - h;
    }
  }

  void display() {
    rect(x, y, w, h);
  }
}
