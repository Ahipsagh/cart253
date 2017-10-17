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
    if (score > 10) {
      
      println("Game Over");
    }
  }
  //------------------------------------------------------------------------------------//
  // display()
  //------------------------------------------------------------------------------------//
  //
  // Display the scores
  //
  void display() {

   text("Game Over", 200, CENTER); // show GAME OVER on screen
   fill(0,255,0);
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
/*
*/