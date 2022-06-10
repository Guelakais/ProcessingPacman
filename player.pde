public class Player extends Entity{
  
    private float mundweite = PI;
    private boolean mundschließen = true;
  
    public Player (float posx , float posy , float speedx , float speedy, float radius){
    //Standardgeist
    this.posx = posx;
    this.posy = posy;
    this.speedx = speedx;
    this.speedy = speedy;
    this.radius = radius;
    this.red = 214;
    this.green = 209;
    this.blue = 52;
  }
  
    public void spielerzeichnen(){
    fill (red, green, blue);
    arc (posx, posy, radius, radius, mundweite/2 + direction, 2*PI - mundweite/2 + direction);
    
    if (mundschließen){
      mundweite = mundweite + 0.1;
      if (mundweite > PI/1){
        mundschließen = false;
      }
    } 
    else {
      mundweite = mundweite - .1;
      if (mundweite < 0){
        mundschließen = true;
      }
    }
  }
  
  public void playermovement(){
    if (keyPressed) {
      if (key == 'd'){
        posx += 4;
        direction = 0;
      }
      if (key == 'a'){
        posx -= 4;
        direction = PI;
      }
      if (key == 'w'){
        posy -= 4;
        direction = PI * 3/2;
      }
      if (key == 's')
      {
        posy += 4;
        direction = PI/2;
      }
      if(key == 'h'){
        score += 50;
        textSize(100);
        text("Du Lappen!", width/1.5, height/2);
      }
      if(key == 'j'){
        score -= 50;
      }
    }
  }
  
  public float getx(){
    return posx;
  }

  public float gety(){
    return posy;
  }
  
  public float getr(){
  return radius;
  }
  
  public float getDirection(){
    return direction;
  }
}
