//------------------------------------------------------------------------------------//
// GameOver
//------------------------------------------------------------------------------------//
//
// A class that defines a paddle that can be moved up and down on the screen
// using keys passed through to the constructor.

class GameOver {

  /////////////// Properties ///////////////

  // Default values
  int score;






  /////////////// Constructor ///////////////

  // Score(int _score)
  //
  // Gets the score and displays it on the screen

  GameOver(int _score) {
    score=_score;
  
  }


  /////////////// Methods ///////////////
  //------------------------------------------------------------------------------------//
  // update()
  //------------------------------------------------------------------------------------//
  //
  // Updates position based on velocity and constraints the paddle to the window

  void update() {
    // Update scores
    if (score == 10) {
      winner=true;
      gameIsOver=true;
//      println("Game Over");
    }
  }
  //------------------------------------------------------------------------------------//
  // display()
  //------------------------------------------------------------------------------------//
  //
  // Display the scores
  //
  void display() {

   fill(0,255,0);
   textSize(92);
   text("Game Over", 80, 350); // Text on screen Game Over



  }
}
/*
*/