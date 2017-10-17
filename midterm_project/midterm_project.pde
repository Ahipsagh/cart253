//------------------------------------------------------------------------------------//
// CART253
// Midterm Project: Pong
// Professor      : Pippin Barr
// Student        : Ariana Hipsagh
// Student Number : 22689812
// Repository     : https://github.com/ahipsagh/cart253
// email          : ani.ariane.hipsagh@gmail.com
//
//
//------------------------------------------------------------------------------------//
// Pong
//
//
//A simple version of Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two paddles that they control.
//
// No scoring. (Yet!)
// No score display. (Yet!)
// Pretty ugly. (Now!)
// Only two paddles. (So far!)
// Declare variables
//------------------------------------------------------------------------------------//
//------------------------------------------------------------------------------------//
// Environment
//------------------------------------------------------------------------------------//
//
// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;
Score enme_Score;
Score player_Score;
GameOver gameOver;



// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;
int enmeScore = 0;
int playerScore = 0;
int gameOverScore=0;

// The background colour during play (black)
color backgroundColor = color(0);
color ENME_COLOR = color(255,0,0);
color PLAYER_COLOR = color(0,0,255);

int left = 100;
int right = 400;

//------------------------------------------------------------------------------------//
// setup()
//------------------------------------------------------------------------------------//
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(640, 480);

  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  leftPaddle = new Paddle(PADDLE_INSET, height/2, '1', 'q', ENME_COLOR);
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p',PLAYER_COLOR);

  // Create the ball at the centre of the screen
  ball = new Ball(width/2, height/2);
  
  // Create enme and player Score
  enme_Score = new Score(enmeScore, ENME_COLOR, left);
  player_Score = new Score(playerScore, PLAYER_COLOR, right);
  gameOver = new GameOver(gameOverScore);
}
//------------------------------------------------------------------------------------//
// draw()
//------------------------------------------------------------------------------------//
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

void draw() {
  // Fill the background each frame so we have animation
  background(backgroundColor);

  // Update the paddles and ball by calling their update methods
  leftPaddle.update();
  rightPaddle.update();
  ball.update();

  

  // Check if the ball has collided with either paddle
  ball.collide(leftPaddle);
  ball.collide(rightPaddle);

  // Check if the ball has gone off the screen
  if (ball.isOffScreen()) {
    println("ball is off screen");
      // If it has, reset the ball
    ball.reset();
  }

  // Display the paddles, score  and the ball
  
  leftPaddle.display();
  enme_Score.display();
  rightPaddle.display();
  player_Score.display();
  if (gameOverScore > 10)
  gameOver.display();
  ball.display();
  
  
    
}
//------------------------------------------------------------------------------------//
// keyPressed()
//------------------------------------------------------------------------------------//
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

void keyPressed() {
  // Just call both paddles' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
}
//------------------------------------------------------------------------------------//
// keyReleased()
//------------------------------------------------------------------------------------//
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}
/*
//------------------------------------------------------------------------------------//

Focus

The focus for this project is on understanding and modifying pre-existing object-oriented
code in a creative and interesting way.

Brief

You have five tasks to complete the project, each one involves editing and changing the
existing code.

1. DONE
Track and display the score
2.
Detect when the game is over and show who won
3.
Change the way the game looks
4.
Change the way the player controls the game
5.
Change the way the ball moves

After completing these tasks you should end up with a version of Pong significantly 
different to the original, with a new appearance, control scheme, movement style, and 
score and result display. Don't forget to be creative! (e.g. Displaying the score with
text at the top of the screen is not so creative...)
// Requirements as per Pippin Barr----------------------------------------------------//

*/