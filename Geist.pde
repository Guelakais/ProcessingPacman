public class Geist extends Entity{
  
  private float mundweite = PI/3;
  
  public Geist (float posx , float posy , float speedx , float speedy, float radius){
    //Standardgeist
    this.posx = posx;
    this.posy = posy;
    this.speedx = speedx;
    this.speedy = speedy;
    this.radius = radius;
    this.red = 229;
    this.green = 12;
    this.blue = 219;
  }
  public Geist (
    float posx , float posy , float speedx , 
    float speedy, float radius,
    int red, int green, int blue
    ){
    this.posx = posx;
    this.posy = posy;
    this.speedx = speedx;
    this.speedy = speedy;
    this.radius = radius;
    this.red = red;
    this.green = green;
    this.blue = blue;
  }
  public void geistzeichnen(){
    
    fill (red, green, blue);
    arc (posx, posy, radius, radius, mundweite/2 + PI/2, 2*PI - mundweite/2 + PI/2);
  
    posx += speedx;
    posy += speedy;
  }   

}
