// all needed ArrayLists
public ArrayList<Rectangle> rectangles = new ArrayList<Rectangle>();
public ArrayList<Geist> geister = new ArrayList<Geist>();
public ArrayList<Dot> biggi = new ArrayList<Dot>();

int ghostMength;
Dot[] dotGenerate;
//Dot[] bigDots = new Dot[4]; kann das weg??
int score = 0;
Player Spieler1;

void setup(){
  size (1000, 900);
  ellipseMode (RADIUS);
  smooth();
  noStroke();

  ghostAdder(4);
  Spieler1 = new Player(width/2, height/2, 0, 0, ((width+height)/2)/40);        //Spieler
  
  wallAdder();
  
  dotGenerate = new Dot[20];
  dotAdder();
  for (int i = 0; i < dotGenerate.length; i++){
    dotGenerate[i] = new Dot();
  }

  
}
public void ghostAdder(int ghostMength){
  this.ghostMength = ghostMength;
    for(int i = 0; i < ghostMength; i++){
      geister.add(
        new Geist(
        50, 50, //Startposition
        random(0, 5), random(0, 5), //Geschwindigkeit in X und Y Ausrichtung
        20,//größe
        (int)random(0,255),(int)random(0,255),(int)random(0,255)//Randomisierte Farbgebung
        ));  
  }
}
public void dotAdder(){
  biggi.add(new Dot(50,50));
  biggi.add(new Dot(width-50,height-50));
  biggi.add(new Dot(width-50, 50));
  biggi.add(new Dot(50, height-50));
}
public void wallAdder(){
  rectangles.add(new Rectangle(0, 0, width, height/35));//up
  rectangles.add(new Rectangle(0, height-20, width, height/35));//down
  //left
  rectangles.add(new Rectangle(0, 0, 20, height/2.5));
  rectangles.add(new Rectangle(0, height/1.7, width/35, height/2.5)); 
  //right
  rectangles.add(new Rectangle(width-20, height/1.7, 20, height/2.5));
  rectangles.add(new Rectangle(width-20, 0, 20, height/2.5));
  //inner walls
  //left
  rectangles.add(new Rectangle(width/10, height/3.3, width/35, height/2.5));
  rectangles.add(new Rectangle(width/5, height/2.2, width/35, height/2.5));
  //right
  rectangles.add(new Rectangle(width-width/8, height/3.3, width/35, height/2.5));
  rectangles.add(new Rectangle(width-width/4.5, height/2.2, width/35, height/2.5));
  //up
  rectangles.add(new Rectangle(width/10, height/8, width/1.25, height/35));//up
  rectangles.add(new Rectangle(width/4, height/4, width/2, height/35));//up
  //down
  rectangles.add(new Rectangle(width/10, height/1.19, width/1.25, height/35));//down
}

void draw(){
  background(0, 0, 0);//Hintergrund in Schwarz
  fill(#324CD8);//blau
  for (int i = 0; i < rectangles.size(); i++) {
    Rectangle rectangle = rectangles.get(i);
    rect(rectangle.getx(), rectangle.gety(), rectangle.getWidth(), rectangle.getHeight());
  }
  
  for(int i = 0; i < ghostMength; i++){
    Geist grun = geister.get(i);
    grun.geistzeichnen();
    grun.bouncewall();
    grun.overflowprotection();
    grun.entityCollision(Spieler1.getx(), Spieler1.gety(), Spieler1.getr());
  }
  
    Spieler1.spielerzeichnen();
    Spieler1.playermovement();
    Spieler1.stopwall(Spieler1.getDirection());
    Spieler1.overflowprotection();
  
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
  dotDrawer();
  //dotDrawer(bigDots);//------------neu!!!
  dotDrawer(dotGenerate);//------------neu!!!
  
  // Draw score
  textAlign(RIGHT);
  textSize(50);
  fill(#F05507);//orange
  text(score, width/2, height/2);
  
  if(score >= 500 || score < 0){
    clear();//Endbildschirm
    textSize(100);
    if(score >= 500){//Bei mehr als 500 Punkten gewinnt man. Das sollte Schaffbar sein.
      fill(#15F007);//gruen
      text("Victory!", width/1.5, height/2);
    } else {//Man verliert, wenn man einen negativen Punktewert erreicht
      fill(#F0071B);//rot
      text("You lose!", width/1.5, height/2);
    }
    noLoop();//Im Grunde eine modifizierte Version von break
  }
}

private void dotDrawer(){
  for(int i = 0; i< biggi.size(); i++){
    Dot dotter = biggi.get(i);
    dotter.drawDot();
    if(dotter.checkCollision(Spieler1.getr())==true){
      biggi.remove(i);
    }
    
  }
}

private void dotDrawer(Dot[] udo){
  for(int i = 0; i<udo.length; i++){
    udo[i].checkCollision(Spieler1.getr());
    udo[i].drawDot();
  }
}
