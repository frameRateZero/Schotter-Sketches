//https://www.openprocessing.org/sketch/900884
//fork of "Gravel" p5.js
//modified for Processing by frameRateZero but otherwise unchanged
//sketch constructs square objects rotated and offset via the setup loop
//then interates throught the array and draws the squares

Square square;
Square[] squaresArray = new Square[170]; 

int ii = 0;

void setup() {
  size(700, 850);
  background(255);
  rectMode(CENTER);
  //angleMode(DEGREES);
  
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 17; j++) {
       square = new Square(200 + i * width / 20 + (random(-j * 3, j * 3)),
                                   50 + j * width / 20 + random(-j * 1.5, j * 1.5),
                                   random(-5 * j, 5 * j), 
                                   width/20);
      squaresArray[ii] = square;
      ii++;
    } 
  }
  
}



void draw() {
  
  for (int i = 0; i < squaresArray.length; i++) {
    squaresArray[i].display();
  }
}

class Square {
  float x; float y; float angle; float size;
  
  Square (float tx, float ty, float tangle, float tsize) {
    x = tx;
    y = ty;
    angle = tangle;
    size = tsize;
  }

 void display() {
    noFill();
    // fill(255);
    pushMatrix();
    translate(this.x, this.y);
    rotate(radians(this.angle));
    square(0, 0, this.size);
    popMatrix();
  }

}
