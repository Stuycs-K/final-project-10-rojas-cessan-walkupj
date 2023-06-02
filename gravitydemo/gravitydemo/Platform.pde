class Platform{
  float w, h, x, y;
  String typeof;
  float hw, hh; 
  
  Platform(float x, float y, float w, float h, String typeof){
    this.w = w;
    this.h = h;
    this.x = x;
    this.y = y;
    this.typeof = typeof; 
    
    hw = w/2;
    hh = h/2;
  }
  
  void display(){
    rect(x,y, w, h);
  }
}
