public class Player {
  float w, h, x, y, vx, vy, accX, accY;
  float gravity, bounce, friction;
  float jumpForce;

  public Player() {
    w = 50;
    h = 75;
    x = 400;
    y = 150;
    vx = 0;
    vy = 0;
    accX = 0;
    accY = 0;
    jumpForce = -5;

    friction = 0.96;
    gravity = 0.6;
    bounce = -0.2;

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
    bounds();
  }

  void bounds() {
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
