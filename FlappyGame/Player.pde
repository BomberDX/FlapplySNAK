PImage img;

class Player {
  float xPos;
  float yPos;
  float objWidth;
  float objHeight;
  float jumpImpulse;
  float gravity;
  float yVelocity;

  Player() {
    jumpImpulse = -9;
    gravity = 0.5;
    objWidth = 75;
    objHeight = 75;
    xPos = 50;
    yPos = (height/2) - objHeight;
    yVelocity = 0;
    img = loadImage("peach.png");
  }

  // Shows player.
  void show() {
    fill(255);
    image(img, xPos, yPos, objWidth, objHeight);
  }

  // Moves player down.
  void move() {
    yVelocity = yVelocity + gravity;
    yPos = yPos + yVelocity;
    // WRITE METHOD
  }

  // Moves player up.
  void jump() {
    yVelocity = jumpImpulse;
    // WRITE METHOD
  }
}