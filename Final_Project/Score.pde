class Score {
  // Default values
  int score;
  int time;
  boolean endSoundIsPlaying = false;
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
    fill(0, 0, 0, 80);
    rect(1175, 50, 400, 350);
    PFont courierFont = createFont("Courier", 64); // Create a Courier font
    textFont(courierFont); // Use the new font
    textSize(45);

    //fill(127, 127, 127);
    fill(333, 333, 333);
    text("monster", 1300, 100); // show timer on screen
    text("countdown", 1300, 150); // show timer on screen

    fill(255, 255, 255);
    text("hearts", 1300, 300); // show counter on screen
    text("collected", 1300, 350); // show counter on screen
    text(counter, 1200, 350); // show counter on screen

    text( ( (timer.getRunTime()<=42)&& (timer.getRunTime()>=0) ?  42-(int)timer.getRunTime() : 0), 1200, 150); // show timer on screen
    if (timer.getRunTime() >15) 
      enemy.setScale(timer.getRunTime()/10);
      
  }

  void gameOver()
  {
    if ( (winner=="you") && (gameIsOver==true) )
    {
      enemy.setDead(true);
      if (!endSoundIsPlaying) {
        win.amp(0.7);
        win.play();
        endSoundIsPlaying = true;
      }
      //win.stop();
      PFont courierFont = createFont("Courier", 64); // Create a Courier font
      textFont(courierFont); // Use the new font
      fill(0, 255, 0);
      textSize(92);
      text("Game Over", 1000, 450); // Text on screen Game Over
      text("monster is GONE", 1000, 550); // Text on screen Game Over
    } else if ( (winner=="monster") && (gameIsOver==true) )
    {
      if (!endSoundIsPlaying) {
        lose.amp(0.3);
        lose.play();
        endSoundIsPlaying = true;
      }
      PFont courierFont = createFont("Courier", 64); // Create a Courier font
      textFont(courierFont); // Use the new font
      fill(0, 255, 0);
      textSize(92);
      text("Game Over", 1000, 450); // Text on screen Game Over
      text("monster GOT you ", 1000, 550); // Text on screen Game Over
     
    }
  }
}