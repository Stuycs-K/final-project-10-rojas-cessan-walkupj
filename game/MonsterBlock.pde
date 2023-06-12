class MonsterBlock extends Block{
    private int x, y;
  private PImage image = loadImage("blockImages/monsterBlock.gif"); //will be a gif

  public MonsterBlock(){
    this.image = image;
  }
  public void drawBlock(int x, int y){
    this.x = x;
    this.y = y;
    image.resize(100, 100); 
    image(image, x, y);
  }
  public int getX(){
    return this.x;
  }
  public int getY(){
    return this.y;
  }
  public boolean isEmpty(){
    return false;
  }
  public String type(){
    return "Monster";
  }
}
