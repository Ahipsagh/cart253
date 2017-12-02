class Score {
  // Default values
  int score;
  /////////////// Constructor ///////////////

  // Score(int _score)
  //
  // Gets the counter and displays it on the screen

  Score(int counter) {
    score=counter;
  }


  /////////////// Methods ///////////////
  //------------------------------------------------------------------------------------//
  // update()
  //------------------------------------------------------------------------------------//
  //
  // Updates position based on velocity and constraints the paddle to the window

  void update() {
    // Update scores
    if (score == 42) {
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
println("------------------------------------------------------------");
    //fill(0,255,0);
    //textSize(92);
    //text("Game Over", 80, 350); // Text on screen Game Over

    PFont courierFont = createFont("Courier", 64); // Create a Courier font
    textFont(courierFont); // Use the new font
    textSize(45);
    fill(0, 0, 0);
    text(counter, 80, 350); // show counter on screen
  }
}