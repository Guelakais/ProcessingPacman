public class Dot{
  private float x, y, size;
  public Dot (){
    generateDot();
    this.size = 12;
  }

  public Dot( float x, float y){
    this.x = x;
    this.y = y;
    this.size = 25;
  }
  
  private boolean wandkollision(){                                              //vielleicht noch bounce und stop methode
    for (int i = 0; i < rectangles.size(); i++) {
      Rectangle rectangle = rectangles.get(i);

        if (x + size > rectangle.getx() && 
            x - size < rectangle.getx() + rectangle.getWidth() && 
            y + size > rectangle.gety() && 
            y - size < rectangle.gety() + rectangle.getHeight()) {
            return true;
        }
    }
    return false;
  }
  
  private void generateDot(){
    do{
    this.x = random (25, width - 25);
    this.y = random (25, height - 25);
    } 
    while(wandkollision());
  }
   
  public float getx(){
    return x;
  }
  public float gety(){
    return y;
  }

  public void drawDot (){
    fill (255);
    ellipse (this.x, this.y, size, size);
  }

  public boolean checkCollision (float playerRadius){
    if (dist(getx(), gety(), Spieler1.getx(), Spieler1.gety()) < playerRadius + size &&
             size <= 12
        ) {
      generateDot();
      score += 5;
      return true;
    } else if(
      dist(getx(), gety(), Spieler1.getx(), Spieler1.gety()) < playerRadius + size &&
             size >= 12
    ){
      this.x = -50;
      this.y = -50;
      score +=50;
      return true;
    }

    return false;
  }
}
