//------------------------------------------------------------------------------------
// Score Class takes care of controlling the enemy timer countdown as well as the 
// avatar collectible counter
//
//------------------------------------------------------------------------------------
class Score {
  // Default values
  int score;
  int time;
  boolean endSoundIsPlaying = false;

  //------------------------------------------------------------------------------------
  // Score(int _score)
  //
  // score counter, timer and displays it on the screen
  Score(int counter)
  {
    score=counter;
    time=(int)timer.getRunTime()/100;
  }

  //------------------------------------------------------------------------------------
  // Updates position based on velocity and constraints the hearts to the window
  //
  void update() {
    //------------------------------------------------------------------------------------
    // Update scores - You Win !
    if (counter == 42) {
      winner="you";
      gameIsOver=true;
    }
  }

  //------------------------------------------------------------------------------------
  // Display the scores
  //
  void display() {
    //------------------------------------------------------------------------------------
    fill(0, 0, 0, 80);
    rect(1175, 50, 400, 350);
    PFont courierFont = createFont("Courier", 64); // Create a Courier font
    textFont(courierFont); // Use the new font
    textSize(45);
    // display box    
    fill(333, 333, 333);
    text("monster", 1300, 100); // show timer on screen
    text("countdown", 1300, 150); // show timer on screen
    // display text
    fill(255, 255, 255);
    text("hearts", 1300, 300); // show counter on screen
    text("collected", 1300, 350); // show counter on screen
    text(counter, 1200, 350); // show counter on screen
    // got to use an inline if statement
    text( ( (timer.getRunTime()<=42)&& (timer.getRunTime()>=0) ?  42-(int)timer.getRunTime() : 0), 1200, 150); // show timer on screen
    if (timer.getRunTime() >10) 
      enemy.setScale(timer.getRunTime()/3);
  }

//------------------------------------------------------------------------------------
// Game over when avatar has collected 42 hearts in order to get rid of the monser
//
// Game over when enemy countdown reaches 0 and avatar does not have the required 
// number of collectibles
//
void gameOver()
//------------------------------------------------------------------------------------  
  {
    if ( (winner=="you") && (gameIsOver==true) )
    {
      enemy.setDead(true); // remove the enemy from the screen
      if (!endSoundIsPlaying) {
        win.amp(0.7);
        win.play();
        endSoundIsPlaying = true;
      }
      song.stop();
      PFont courierFont = createFont("Courier", 64); // Create a Courier font
      textFont(courierFont); // Use the font
      fill(0, 255, 0);
      textSize(92);
      text("Game Over", 800, 450); // Text on screen Game Over
      text("monster is GONE", 800, 550); // Text on screen Game Over
    } else if ( (winner=="monster") && (gameIsOver==true) )
    {
      if (!endSoundIsPlaying) {
        lose.amp(0.3);
        lose.play();
        endSoundIsPlaying = true;
      }
      song.stop();
      PFont courierFont = createFont("Courier", 64); // Create a Courier font
      textFont(courierFont); // Use the font
      fill(0, 255, 0);
      textSize(92);
      text("Game Over", 800, 450); // Text on screen Game Over
      text("monster GOT you ", 800, 550); // Text on screen Game Over
    }
  }
}