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

    println("score=" + score + counter);
    // Update scores
    if (counter == 42) {
      winner="you";
      gameIsOver=true;

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
    println("score" + gameIsOver);

    PFont courierFont = createFont("Courier", 64); // Create a Courier font
    textFont(courierFont); // Use the new font
    textSize(45);
    fill(255, 255, 255);
    text(counter, 370, 300); // show counter on screen
  }

  void gameOver()
  {
    if ( (winner=="you") && (gameIsOver==true) )
    {
      win.amp(0.7);
      win.play();
      PFont courierFont = createFont("Courier", 64); // Create a Courier font
      textFont(courierFont); // Use the new font
      fill(0, 255, 0);
      textSize(92);
      text("Game Over", 80, 350); // Text on screen Game Over
      text("NO More monster ", 80, 250); // Text on screen Game Over
    } else if ( (winner=="monster") && (gameIsOver==true) )
    {
      lose.amp(0.3);
      lose.play();
      PFont courierFont = createFont("Courier", 64); // Create a Courier font
      textFont(courierFont); // Use the new font
      fill(0, 255, 0);
      textSize(92);
      text("Game Over", 80, 350); // Text on screen Game Over
      text("monster GOT you ", 80, 250); // Text on screen Game Over
    }
  }
}