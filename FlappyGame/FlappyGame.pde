import processing.sound.*;
PImage imags;
int score;
int gameState; // 0 = start, 1 = running, 2 = over
Player assault;
Pipe pipeOne;
SoundFile bgMusic;
SoundFile scoreMusic;

void setup() {
  size(700, 830);
  textAlign(CENTER);
  score = 0;
  gameState = 0;
  imags = loadImage("final.jpg");

  assault = new Player();
  pipeOne = new Pipe(1);
  bgMusic = new SoundFile(this, "Metal_Gear_Solid_Music_-_Alert_Phase.wav");
  bgMusic.loop();
  scoreMusic = new SoundFile(this, "face punch  sound effect.mp3");
}

void draw() {
  image(imags, 0, 0, width, height);
  if (gameState == 0) {
    // game start
    fill(255, 136, 16);
    textSize(30);
    text("Flappy Game", 200, 100);
    assault.show();
  } else if (gameState == 1) {
    // game running
    if ( assault.yPos <= 0 || height <= assault.yPos) {
      assault.yPos = height - assault.objHeight - 20;
      gameState = 2;
    }
    if ( assault.xPos < pipeOne.xPos + pipeOne.objWidth 
      && assault.xPos + assault.objWidth > pipeOne.xPos 
      && assault.yPos < pipeOne.yPos + pipeOne.objHeight 
      && assault.yPos + assault.objHeight > pipeOne.yPos ) {
      gameState = 2;
    }
    //plus 1 score
    if (pipeOne.counted == false && assault.xPos >= pipeOne.xPos) {
      score = score + 1;
      pipeOne.counted = true;
      //scoreMusic.play();
    }
    pipeOne.show();
    assault.show();
    assault.move();
    pipeOne.move();
    text(score, width/2, 60);
  } else { // gameState == 2
    pipeOne.show();
    assault.show();
    text(score, width/2, 60);
    text("Game Over", width/2, height/2);
  }
  println(gameState);
}

void keyPressed() {
  if (key == ' ' && gameState == 0) {
    gameState = 1;
  }
  if (key == ' ' && gameState == 1) {
    assault.jump();
  }
  if (key == ' ' && gameState == 2) {
    gameState = 1;
    score = 0;
    assault = new Player();
    pipeOne = new Pipe(1);
    assault.jump();
  }
}