public class Entity{
  protected float posx, posy, speedx, speedy, radius;
  protected int red, green, blue;
  protected float direction = 0;

   public void bouncewall(){
     for (int i = 0; i < rectangles.size(); i++) {
      Rectangle rectangle = rectangles.get(i);
       //check X movment bounce
        if (posx + radius + speedx > rectangle.getx() &&           //betrachtet alle 4 ecken falls das springende Rechteck eine dieser Grenzen überschreitet wird v umgekehrt
            posx + speedx < rectangle.getx() + rectangle.getWidth() &&         // einmal für Bewegung in x Richtung
            posy + radius > rectangle.gety() && 
            posy < rectangle.gety() + rectangle.getHeight()) {
    
          speedx *= -1;
        }
    
        //check Y movement bounce
        if (posx + radius> rectangle.getx() &&                                 // und einmal für Bewegung in y Ricting
            posx  < rectangle.getx() + rectangle.getWidth() && 
            posy + radius + speedy > rectangle.gety() && 
            posy + speedy < rectangle.gety() + rectangle.getHeight()) {
    
          speedy *= -1;
        }
     }
   }
   public void entityCollision(float eposx, float eposy, float radius){                          //vielleicht noch oder das gleiche wie entity collision
    score = (dist(posx, posy, eposx, eposy) < (radius + radius))? score - 10: score;
  }
   public void overflowprotection(){
     posx = posx >= width ? 0 : posx;
     posx = posx < 0.0 ? width : posx;
     posy = posy >= height ? 0 : posy;
     posy = posy < 0.0 ? height : posy;
   }
     public void stopwall(float movingdirection){
    for (int i = 0; i < rectangles.size(); i++) {
      Rectangle rectangle = rectangles.get(i);
      if (posx + radius > rectangle.getx() && 
          posx - radius < rectangle.getx() + rectangle.getWidth() && 
          posy + radius > rectangle.gety() && 
          posy - radius < rectangle.gety() + rectangle.getHeight()) {

            if (movingdirection == 0){posx = rectangle.getx() - radius;}                                            //Richtung rechts
            if (movingdirection == PI/2){posy = rectangle.gety() - radius;}                                         //unten      
            if (movingdirection == PI){posx = rectangle.getx() + rectangle.getWidth() + radius;}                    //links
            if (movingdirection == PI*3/2){posy = rectangle.gety() + rectangle.getHeight() + radius;}               //oben          
      }
    }     
  }
}
