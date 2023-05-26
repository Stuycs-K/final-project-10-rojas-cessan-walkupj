class MonsterBlock extends Block{
  private PImage image = loadImage("blockImages/monsterBlock.gif"); //will be a gif
  public void attack(){
    
  }
  public void drawBlock(int x, int y){
    image.resize(100, 100); 
    image(image, x, y);
  }
}
