class Score {
  // Default values
  int score;
  int time;
  /////////////// Constructor ///////////////

  // Score(int _score)
  //
  // Gets the counter and displays it on the screen

  Score(int counter)
  {
    score=counter;
    time=(int)timer.getRunTime()/100;
  }


  /////////////// Methods ///////////////
  //------------------------------------------------------------------------------------//
  // update()
  //------------------------------------------------------------------------------------//
  //
  // Updates position based on velocity and constraints the paddle to the window

  void update() {

    // Update scores
    if (counter == 42) {
      winner="you";
      gameIsOver=true;

    }
  }
  //------------------------------------------------------------------------------------//
  // display()
  //------------------------------------------------------------------------------------//
  //
  // Display the scores
  //
  void display() {

    PFont courierFont = createFont("Courier", 64); // Create a Courier font
    textFont(courierFont); // Use the new font
    textSize(45);
    fill(255, 255, 255);
    text(counter, 370, 300); // show counter on screen
    text("monster time", 370, 150); // show timer on screen
    text( ( (timer.getRunTime()<=42)&& (timer.getRunTime()>=0) ?  42-(int)timer.getRunTime() : 0) , 370, 200); // show timer on screen
    if (timer.getRunTime() >15) 
    enemy.setScale(timer.getRunTime()/10);

  }

  void gameOver()
  {
    if ( (winner=="you") && (gameIsOver==true) )
    {
      enemy.setDead(true);
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
      text("Game Over", 80, 250); // Text on screen Game Over
      text("monster GOT you ", 80, 350); // Text on screen Game Over
    }
  }
}