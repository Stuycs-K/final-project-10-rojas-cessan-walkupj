class EmptyBlock extends Block{
  private int x, y;
  //private PImage image = loadImage("blockImages/bridgeBlock.jpg");
  public EmptyBlock(){
  }
  public void drawBlock(int x, int y){
    this.x = x;
    this.y = y;
  }
  public int getX(){
    return this.x;
  }
  public int getY(){
    return this.y;
  }
  public boolean isEmpty(){
    return true;
  }
  public String type(){
    return "Empty";
  }
}
