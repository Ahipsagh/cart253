//------------------------------------------------------------------------------------//
// CART253
// Exercise 02    : Functions and loops
// Professor      : Pippin Barr
// Student        : Ariana Hipsagh
// Student Number : 22689812
// Repository     : https://github.com/ahipsagh/cart253
// email          : ani.ariane.hipsagh@gmail.com
//
//
//------------------------------------------------------------------------------------//
// Declare variables
//------------------------------------------------------------------------------------//
//------------------------------------------------------------------------------------//
// Environment
//------------------------------------------------------------------------------------//
color backgroundColor = color(0);
int numStatic = 1000;
int staticSizeMin = 1;
int staticSizeMax = 3;
color staticColor = color(200);
//
//------------------------------------------------------------------------------------//
// Paddle
//------------------------------------------------------------------------------------//
int paddleX;
int paddleY;
int paddleVX;
int paddleSpeed = 10;
int paddleWidth = 128;
int paddleHeight = 16;
color paddleColor = color(255);
//
//------------------------------------------------------------------------------------//
// Ball
//------------------------------------------------------------------------------------//
int ballX;
int ballY;
int ballVX;
int ballVY;
int ballSpeed = 5;
int ballSize = 16;
color ballColor = color(255);
//
//------------------------------------------------------------------------------------//
// Main program begins here
//------------------------------------------------------------------------------------//
// Pong Game - the original video game vintage style
//           - single player against computer
//
void setup() {
  size(640, 480);
  
  setupPaddle();
  setupBall();
}

//------------------------------------------------------------------------------------//
// setupPaddle
//------------------------------------------------------------------------------------//
void setupPaddle() {
  paddleX = width/2;
  paddleY = height - paddleHeight;
  paddleVX = 0;
}

//------------------------------------------------------------------------------------//
// setupBall 
//------------------------------------------------------------------------------------//
void setupBall() {
  ballX = width/2;
  ballY = height/2;
  ballVX = ballSpeed;
  ballVY = ballSpeed;
}

//------------------------------------------------------------------------------------//
// Draw 
//------------------------------------------------------------------------------------//
void draw() {
  background(backgroundColor);

  //ah drawStatic();

  updatePaddle();
  updateBall();

  drawPaddle();
  drawBall();
}

//------------------------------------------------------------------------------------//
// drawStatic
//------------------------------------------------------------------------------------//
void drawStatic() {
  for (int i = 0; i < numStatic; i++) {
   float x = random(0,width);
   float y = random(0,height);
   float staticSize = random(staticSizeMin,staticSizeMax);
   fill(staticColor);
   rect(x,y,staticSize,staticSize);
  }
}

//------------------------------------------------------------------------------------//
// updatePaddle 
//------------------------------------------------------------------------------------//
void updatePaddle() {
  paddleX += paddleVX;  
  paddleX = constrain(paddleX,0+paddleWidth/2,width-paddleWidth/2);
}

//------------------------------------------------------------------------------------//
// updateBall
//------------------------------------------------------------------------------------//
void updateBall() {
  ballX += ballVX;
  ballY += ballVY;
  
  handleBallHitPaddle();
  handleBallHitWall();
  handleBallOffBottom();
}

//------------------------------------------------------------------------------------//
// drawPaddle
//------------------------------------------------------------------------------------//
void drawPaddle() {
  rectMode(CENTER);
  noStroke();
  fill(paddleColor);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
}

//------------------------------------------------------------------------------------//
// drawBall
//------------------------------------------------------------------------------------//
void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  rect(ballX, ballY, ballSize, ballSize);
}

//------------------------------------------------------------------------------------//
// handleBallHitPaddle
//------------------------------------------------------------------------------------//
void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;
  }
}

boolean ballOverlapsPaddle() {
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
    if (ballY > paddleY - paddleHeight/2) {
      return true;
    }
  }
  return false;
}

//
//------------------------------------------------------------------------------------//
// handleBallOffBottom
//------------------------------------------------------------------------------------//
void handleBallOffBottom() {
  if (ballOffBottom()) {
    ballX = width/2;
    ballY = height/2;
  }
}

boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
}

//
//------------------------------------------------------------------------------------//
// handleBallHitWall
//------------------------------------------------------------------------------------//
void handleBallHitWall() {
  if (ballX - ballSize/2 < 0) {
    ballX = 0 + ballSize/2;
    ballVX = -ballVX;
  } else if (ballX + ballSize/2 > width) {
    ballX = width - ballSize/2;
    ballVX = -ballVX;
  }
  
  if (ballY - ballSize/2 < 0) {
    ballY = 0 + ballSize/2;
    ballVY = -ballVY;
  }
}

//
//------------------------------------------------------------------------------------//
// left or right keyboard arrow keyPressed
//------------------------------------------------------------------------------------//
void keyPressed() {
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
  }
}

//
//------------------------------------------------------------------------------------//
// left or right keyboard arrow keyReleased
//------------------------------------------------------------------------------------//
void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  }
}
//------------------------------------------------------------------------------------//
// Program end
//------------------------------------------------------------------------------------//
//--Exercise requirements by Pippin Barr -------------------------------------------------------------------------------//
//
// Exercise Steps
//
// 0. DONE
// Take the exercise code below and put it into a new Processing sketch called exercise02 and place it in your exercises folder in your local repository.
//
// 1. DONE
// Commit this change with a message like "Started exercise 02"
//
// 2. DONE
// Go through the code and make sure you understand how it works (run it too of course!), then comment the code to prove that you understand what is happening. Note: This time you don't need to comment every line. Instead, make sure you comment at the top of the program to explain what it does (generally), at the top of each function to explain what it does, and then on any lines that need explaining (perhaps if statements, for example, or anything slightly complex)
//
// 3. DONE
// Commit this change with a message like "Commented exercise code".
//
// 4.
// Change how the ball reacts to hitting the paddle (maybe it could go faster, maybe it could change colour, maybe it could become invisible, maybe it could go in a random direction, ...)
//
// 5.
// Add comments to your change and include a comment that says CHANGED so we can see where you've made changes
//
// 6.
// Commit this change with an explanation of how you changed the ball behaviour
//
// 7.
// Add a new loop anywhere in the code that changes how the game looks (maybe it draws multiple paddles up the screen based on the 'real' one, maybe it draws the paddle so it's made out of lots of little rectangles of different colours, maybe it draws multiple balls on the screen only one of which is the real one, ...)
//
// 8.
// Add comments to your change and include a comment that says CHANGED wherever you made your changes
//
// 9.
// Commit your change with an explanation of how you used the loop
//
// 10.
// Add a new function to the program that checks some new situation for the ball (like handleBallOffScreen() does for example) and reacts to it (maybe it checks which quadrant of the screen the ball is in and sets its colour based on that, maybe it sets the ball's velocity based on how many times it has hit the paddle [you would need a new variable to track the number of hits for this!], ...). Make sure you call the function from the the updateBall() function.
//
// 11.
// Add comments to your change and include a comment that says CHANGED wherever you made your changes
//
// 12.
// Commit your change with an explanation of the function you added
//
// 13.
// Don't forget to push your repository to github.com either at the end or throughout
//
// 14.
// You're done!
//
// 15.
// Challenge: Can you add a scoring system to the game? What should the player get points for? How do you track the points? How could you display the score? With text at the top? In a more creative way?
//
//--END of requirements by Pippin Barr -------------------------------------------------------------------------------//