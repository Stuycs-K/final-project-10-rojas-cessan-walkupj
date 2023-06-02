class Platform{
  float w, h, x, y;
  String typeof;
  
  Platform(float x, float y, float w, float h){
    this.w = w;
    this.h = h;
    this.x = x;
    this.y = y; 
  }
  
  void display(){
    rect(x,y, w, h);
  }
}
