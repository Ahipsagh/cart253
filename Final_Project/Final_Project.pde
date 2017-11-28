
//------------------------------------------------------------------------------------//
// CART253
// Final Project  : Be Love
// Professor      : Pippin Barr
// Student        : Ariana Hipsagh
// Student Number : 22689812
// Repository     : https://github.com/ahipsagh/cart253
// email          : ani.ariane.hipsagh@gmail.com
//
//
//------------------------------------------------------------------------------------//
// Be Love
//
//
// 
// Declare variables
//------------------------------------------------------------------------------------//
//------------------------------------------------------------------------------------//
// Environment
//------------------------------------------------------------------------------------//
//
// Global variables for the paddles and the Heart

PImage[] aHeart = new PImage[7];

Heart[] Heart= new Heart[4];

void setup()
{
  size(500,500);

for (int i= 0; i< aHeart.length; i++)
{
  aHeart[i] = loadImage("heart"+0+".png");

}
for (int i= 0; i< Heart.length; i++)
{
 // loading random Heart images into an image array
  int index = int(random(0, aHeart.length));
  Heart[i] = new Heart(aHeart[index], 100+i*100, 300, random (32, 72));
}
}

void draw() {

  background(255);
  
for (int i= 0; i< Heart.length; i++)
{
Heart[i].ascend();
Heart[i].display();
}
}
/*
//------------------------------------------------------------------------------------//

Create a prototype of a key part of your final project. - REDO

Brief

Because it's time to be focused entirely on the final project, this week's exercise is 
to make sure you build a prototype of some part of that project. The best idea would be 
to create a prototype that has the absolutely most basic features of your project (such 
as moving an avatar and collecting items, say). Placeholder art (including just shapes) 
is completely fine. The key is to get the basic code for your project working and 
experienceable.

If you have already created such a prototype (which would have been a good idea anyway), 
feel free to tidy it up, comment it well, make sure your variable names are sensible, and 
then submit it. Make a note in your code if you have fewer than the minimum commits 
because you had already written it earlier.

Exercise Steps

Because there isn't a set of steps to follow you should just make sure to follow the 
basic process of using Git to track your work:

0. Version 2.0 Begins - Done
Come up with an idea for part of your prototype

1.
Write some code that achieves that and comment it clearly

2.
Commit this code with a message that describes what you added

3.
Push your changes at regular intervals

4.
Repeat
// Requirements as per Pippin Barr----------------------------------------------------//

*/