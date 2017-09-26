//------------------------------------------------------------------------------------//
// CART253
// Exercise 01    : Conditionals and variables
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
//
//------------------------------------------------------------------------------------//
// CONSTANTS in CAPS - values do not change
//------------------------------------------------------------------------------------//
final int CIRCLE_SPEED = 7;
final color NO_CLICK_FILL_COLOR = color(250, 100, 100);
final color CLICK_FILL_COLOR = color(100, 100, 250);
final color BACKGROUND_COLOR = color(250, 150, 150);
final color STROKE_COLOR = color(250, 150, 150);

//
//------------------------------------------------------------------------------------//
// Local variables in camel case - values may change
//------------------------------------------------------------------------------------//
int circleX;
int circleY;
int circleVX;
int circleVY;
//step 5. of exercise 01 --- add new variable to change fill color (with initial value of red) on if else condition.
color changeFillColor = color(255, 0, 0);
//
//------------------------------------------------------------------------------------//
// Main program begins here
//------------------------------------------------------------------------------------//
void setup() {
//
//------------------------------------------------------------------------------------//
// Initialize variables
//------------------------------------------------------------------------------------//
  size(640, 480);
  circleX = width/2;
  circleY = height/2;
  circleVX = CIRCLE_SPEED;
  circleVY = CIRCLE_SPEED;
  stroke(STROKE_COLOR);
  fill(NO_CLICK_FILL_COLOR);
  background(BACKGROUND_COLOR);
}
//------------------------------------------------------------------------------------//
// Initialize variables
//------------------------------------------------------------------------------------//
//------------------------------------------------------------------------------------//
//s8
//step 8. add variables to check that each if and else condition has executed at least once before end of game
// changed CIRCLE_SIZE to a regular variable
//------------------------------------------------------------------------------------//
  int check1=0;
  int check2=0;
  int check3=0;
  int check4=0;
  int circleSize = 50;
  
void draw() 
{
//------------------------------------------------------------------------------------//
//s9 Is the game over ?  Continue to play game until it has gone through all of the if iterations which are checked.
      if (check1 + check2 + check3 + check4 != 4) {
        playGame();
      }
else 
{ //s9 else game is  over
//------------------------------------------------------------------------------------//
       changeFillColor = color(0, 127, 0); // green
       fill(changeFillColor);
//------------------------------------------------------------------------------------//
//s9 speed up circle and increase size     
          circleVX++;
          circleVY++;
          circleSize*=1.5;
          circleX += circleVX;
          circleY += circleVY;
          ellipse(circleX, circleY, circleSize, circleSize);
//------------------------------------------------------------------------------------//
//s9 Game Over on screen
      changeFillColor = color(0, 0, 255);
      fill(changeFillColor);
      textSize(92);
      text("Game Over", 12, 100); // Text on screen Game Over
      textSize(64);              
      text("Game Over", 20, 230); // Text on screen Game Over
      fill(127, 50, 153, 70);
      text("game", 240, 350);     // Text on screen Game  
      textSize(32);
      fill(127, 50, 153, 51);
      text("OVER", 460, 450);     // Text on screen OVER

} 
}
//------------------------------------------------------------------------------------//
//step 9 
// Created a function playGame to run the main if iteration
//------------------------------------------------------------------------------------//

void playGame() 
{
// Check : when circle has reached edge of environment SIZE  
  if (dist(mouseX, mouseY, circleX, circleY) < circleSize/2) 
  {
//s5 fill(CLICK_FILL_COLOR);
//step 5. change to green
   changeFillColor = color(0, 255, 0);
   fill(changeFillColor);
   println("check 1");
   check1=1; //s7 set check1 to 1
  }
  else 
  {
//------------------------------------------------------------------------------------//
//step 5. change to random color
//s5    fill(NO_CLICK_FILL_COLOR);
//------------------------------------------------------------------------------------//

}
// Check : move the circle by increasing the position coordinates 
  ellipse(circleX, circleY, circleSize, circleSize);
  circleX += circleVX;
  circleY += circleVY;
  //println("check 2");
  
   check2=1; //s7 set check2 to 1
  
// Check :  when circle has reached either horizontal edge of the environment (SIZE) in order to prevent it  
//          from going outside of the horizontal environment range and bounce it back
  if (circleX + circleSize/2 > width || circleX - circleSize/2 < 0) 
  {
    circleVX = -circleVX;
//------------------------------------------------------------------------------------//
//step 5. change to random color lower than (100,100,100)
//------------------------------------------------------------------------------------//

    changeFillColor = (int) color (random(0, 100),random(0,100),random(0,100));
    fill(changeFillColor);
    println("check 3");
    check3=1; //s7 set check3 to 1
  }
// Check :  when circle has reached either vertical edge of the environment (SIZE) in order to prevent it  
//          from going outside of the vertical environment range and bounce it back  
  if (circleY + circleSize/2 > height || circleY - circleSize/2 < 0) 
  {
    circleVY = -circleVY;
//------------------------------------------------------------------------------------//
//step 5. change to random color higher than (100,100,100)

//------------------------------------------------------------------------------------//
    changeFillColor = (int) color (random(100, 255),random(100,255),random(100,255));
    fill(changeFillColor);
    println("check 4");
    check4=1; //s7 set check4 to 1
  }
  
}

//------------------------------------------------------------------------------------//
// Mouse
//------------------------------------------------------------------------------------//
void mousePressed() 
{
  background(BACKGROUND_COLOR);
}

//------------------------------------------------------------------------------------//
// Program end
//------------------------------------------------------------------------------------//
//--Exercise instructions by Pippin Barr -------------------------------------------------------------------------------//
//
// Exercise Focus
//
// The focus this week is on understanding and using variables and conditionals for animation and interactivity.
//
// Exercise Steps
//
//- 0. If you haven't already, set up a GitHub account and create your CART 253 repository.
//- 1. Take the exercise code below and put it into a new Processing sketch called exercise01 and place it in your exercises folder in your local repository.
//- 2. Commit this change with a message like "Started exercise 01"
//- 3. Go through the code and make sure you understand how it works (run it too of course!), then comment the code to prove that you understand what is happening.
//- 4. Commit this change with a message like "Commented exercise code".
//- 5. Add a new variable to the code and use it somewhere so that it changes and affects the visuals, e.g. you might want to add a current CircleSize variable that changes over time, instead of the constant circleSize that is used right now.
//- 6. Put comments around the changes you have made to the code that say something like "CHANGED" followed by an explanation.
//- 7. Commit this change with a message explaining what you did.
//- 8. Add a new conditional to the code that reacts to the user's input, e.g. you might want change the shape that is drawn based on where in the window the mouse is.
//- 9. Put comments around the changes you have made to the code that say something like "CHANGED" followed by an explanation.
// 10. Commit this change with a message explaining what you did.
// 11. Don't forget to push your repository to github.com either at the end or throughout
// 12. You're done!
//
//--END of instructions by Pippin Barr -------------------------------------------------------------------------------//