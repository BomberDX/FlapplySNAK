PImage imag;
class Pipe {
  float xPos;
  float yPos;
  float objWidth;
  float objHeight;
  float xVelocity;
  boolean counted;

  Pipe(int num) {
    counted = false;
    objWidth = 100;
    objHeight = 360;
    xPos = width + (num * (width/2));
    yPos = chooseYPos();
    xVelocity = -15;
    imag = loadImage("SNAK.png");
  }

  // Shows pipe.
  void show() {
    fill((int)random(255));
    image(imag, xPos, yPos, objWidth, objHeight);
    // WRITE METHOD
  }

  // Moves pipe across the screen.
  void move() {
    xPos = xPos + xVelocity;
    if (xPos + objWidth < 0) {
      reset();
    }
  }

  // Resets pipe at initial location.
  void reset() {
    // WRITE METHOD
    xPos = width;
    counted = false;
    yPos = chooseYPos();
  }

  // Returns y position for either top pipe or bottom pipe.
  float chooseYPos() {
    int location = (int)random(2);
    if (location == 0) {
      return 0;
    } else {
      return height - objHeight;
    }
  }
}