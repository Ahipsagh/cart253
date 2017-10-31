//------------------------------------------------------------------------------------//
// CART253
// Exercise 05    : Math Tricks
// Professor      : Pippin Barr
// Student        : Ariana Hipsagh
// Student Number : 22689812
// Repository     : https://github.com/ahipsagh/cart253
// email          : ani.ariane.hipsagh@gmail.com
//
//------------------------------------------------------------------------------------//
// Exercise 05 adding noise to Fish
//------------------------------------------------------------------------------------//
// using one of the sample pieces of code to have random fish float to the top of the 
// screen and applying a random noise factor to their sizes.
//
// The random noise is applied to a fishing line as well.
//

PImage[] aFish = new PImage[7];

Fish[] fish= new Fish[4];

void setup()
{
  size(500,500);

for (int i= 0; i< aFish.length; i++)
{
  aFish[i] = loadImage("fish"+i+".png");

}
for (int i= 0; i< fish.length; i++)
{
 // loading random fish images into an image array
  int index = int(random(0, aFish.length));
  fish[i] = new Fish(aFish[index], 100+i*100, 300, random (32, 72));
}
}

void draw() {

  background(255);
  
for (int i= 0; i< fish.length; i++)
{
fish[i].ascend();
fish[i].display();
}
}
/*
//--Requirements as per Wiki --------------------------------------------------------//
//
Because there isn't a set piece of code the brief is more open and there are no explicit
steps to follow. However, it is perfectly fine to take code from the slides or other 
examples and modify it. Always make sure, however, that when you take code from somewhere 
else, you very clearly indicate that with comments that show which code has been found 
elsewhere, who wrote that code, and where you found it. You're also welcome to take code
from past exercises and modify that (though, again, indicate where your new code is 
within it).

Remember, too, that you must follow the basic process of:

1.DONE
Write some code that achieves part of your overall program and comment it
Commit this code with a that describes what you added

2.DONE
Repeat

3.DONE
Then at the end (or throughout), don't forget to push your repository to github.com

Don't write your entire exercise and then submit, break it into smaller commits. 
e.g. committing a pre-existing example, then adding one new function and committing, 
then adding a new class and committing, etc. You can't have too many commits. 
You can have too few.
//
//-End----------------------------------------------------------------------------------//
*/