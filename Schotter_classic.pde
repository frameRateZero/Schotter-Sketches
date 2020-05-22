//Reproduction of Georg Nee's Schotter Lithograph Print
//https://collections.vam.ac.uk/item/O221321/schotter-print-nees-georg/

//by frameRateZero
//https://github.com/frameRateZero/frameRateZero/blob/master/001_Reproducing_Schotter.md
//May 2020

//12 columns
//22 rows
//44 max roatation, increases downward by 2*row (could be swapped to 45/22)
//y and x max jitter increases downward linearly

float size = 28*3; //this block size matches the lithograph
int tRows = 22;


void setup() {
  size(1875, 2500); //set so large to match the lithograph
  frameRate(2);
  //noLoop();
  randomSeed(47);
}




void draw() {


  //set up to look like the lithograph image- paper with black border
  background(0);
  fill(222, 219, 212); //cream color for the "paper"
  rect(120, 60, 1875-220, 2500 - 120); //draws the cream "paper"

  //move to the starting location
  translate(125*3, 75*3);

  //two loops, outer does the y direction (rows), inner does the x direction (columns).
  for (float y = 1; y < tRows+1; y ++) {

    for (float x = 1; x < 13; x ++) {


      pushMatrix();

      //somewhere between 3/4 and 1 based on measurements from the original. Probably 1.
      float offSet =  1;
      
      //'x*size' and 'y*size' move to the next location
      //'size/tRows' is for scaling to any square size and maintaining the jitter in proportion to the size
      translate(x*size+size/tRows * random(-y*offSet, y*offSet), y*size + size/tRows * random(-y*offSet, y*offSet));

      //It's not gaussian? But this setting looks very similar.
      //translate(x * size + size/tRows * y/4 * randomGaussian(), y * size + size/tRows * y/4 * randomGaussian());

      rotate(radians(random(-2*y, 2*y))); 
      //alternatively rotate(radians(random(-45/tRow*y, 45/tRow*y))) to get to 45 deg at any row count

      //draw rectangle (square) at the origin of the translation
      noFill();
      stroke(0);
      strokeWeight(3);
      rect(0, 0, size, size, 2); // slight rounded corners to look more like the lithograph

      popMatrix();
    }
  }
  saveFrame( "SchotterClassic###.png");
}
