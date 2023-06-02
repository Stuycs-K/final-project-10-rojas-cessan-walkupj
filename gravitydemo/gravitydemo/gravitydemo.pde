private Player bro;
Platform p;

private boolean left;
private boolean right;
private boolean up;
private boolean down;

void setup(){
  size (800, 600);
  
  left = false;
  right = false;
  up = false;
  down = false;
  bro = new Player();
  p = new Platform(300, 450, 200, 25, "safe");
}

void draw() {
  background(255);
  bro.update();
  bro.plat = playerBlockInteraction (bro, p);
  bro.display();
  p.display();
  
}

String playerBlockInteraction (Player plyr, Platform block){
  if (plyr.vy < 0) {return "none";}
  float dx = (plyr.x+plyr.w/2) - (block.x + block.w/2);
  float dy = (plyr.y+plyr.h/2) - (block.y+block.h/2);
  float totalhw = plyr.hw + block.hw;
  float totalhh = plyr.hh + block.hh;
  
  if (abs(dx) < totalhw){
    if (abs(dy) < totalhh){
      float overlapX = totalhw - abs(dx);
      float overlapY = totalhh - abs(dy);
      if (overlapX >= overlapY){ 
        if (dy > 0) {
          plyr.y += overlapY;
          return "top";
        }
        else {
          plyr.y -= overlapY;
          return "bottom";
        }
      }
      else {
        if (dx > 0){
          plyr.x += overlapX;
          return "left";
        }
        else{
          plyr.x = overlapX;
          return "right";
        }
          
      }
    }
    else return "none";
  }
  else return "none";
  
}


void keyPressed(){
  switch (keyCode){
    case 'A': //left
      left = true;
      break;
    case 'D': //right
      right = true;
      break;
    case 'W': //up
      up = true;
      break;
    case 'S': //down
      down = true;
      break;     
  }
}

void keyReleased(){
  switch (keyCode){
    case 'A': 
      left = false;
      break;
    case 'D': 
      right = false;
      break;
    case 'W': 
      up = false;
      break;
    case 'S': 
      down = false;
      break;     
  }
  
}
