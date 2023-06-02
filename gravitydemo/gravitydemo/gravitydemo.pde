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
  p = new Platform(0, 450, 0, 25);
}

void draw() {
  background(255);
  bro.update();
  bro.display();
  p.display();
  
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
