//https://www.uni-weimar.de/kunst-und-gestaltung/wiki/images/Schotter_georgnees.pde
//note: this version is a "classic" schotter.


int squareSize = 30;
int border = squareSize * 3;

void setup () {
  size(500,800);

  
  rectMode(CENTER);
  noFill();
  
}
void draw () {
    background(255);
   
  for (int i = 0; i<=11; i++) {
    for (int j = 0; j <= 22; j++) {
      
      int randomOffsetX = int(random(-j,j));
      int randomOffsetY = int(random(-j,j));
      
      int x = border + i* squareSize + randomOffsetX;
      int y = border + j* squareSize + randomOffsetY;
      
      
      float randomRange = 90/22 * j; 
      float angle = radians(random(-randomRange, randomRange));
      
      pushMatrix();
        translate(x,y);
        rotate(angle);
        rect (0,0,squareSize,squareSize);
      
      popMatrix();
    }    
  }

  noLoop();
}
  void mousePressed() {
    redraw();
  }

void keyReleased() {
  save( "schotter-georgNees #.jpg");
}
