//------------------------------------------------------------------------------------//
// Score
//------------------------------------------------------------------------------------//
//
// A class that defines a paddle that can be moved up and down on the screen
// using keys passed through to the constructor.

class Score {

/////////////// Properties ///////////////

// Default values
  int score;
  int leftRight;
  color scoreColor;
  

 


/////////////// Constructor ///////////////

// Score(int _score)
//
// Gets the score and displays it on the screen

  Score(int _score, color _scoreColor, int _leftRight) {
    score = _score;
    scoreColor=_scoreColor;
    leftRight = _leftRight;
   }


/////////////// Methods ///////////////
//------------------------------------------------------------------------------------//
// update()
//------------------------------------------------------------------------------------//
//
// Updates position based on velocity and constraints the paddle to the window

  void update() {
    // Update scores
   score++;
   if (score > 10) {
    gameOver.display();
   }
  }
//------------------------------------------------------------------------------------//
// display()
//------------------------------------------------------------------------------------//
//
// Display the scores
//
void display() {
    
    fill(scoreColor);
    textSize(45);
    //textAlign( 150, leftRight);
    text("Hits " + score , leftRight, 100); // show Hits on screen
    println(abs(score) + " " + leftRight + " " + scoreColor);
}
  



}
/*
*/