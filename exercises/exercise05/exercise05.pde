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
// Exercise 05 Scale and Rotation example
//------------------------------------------------------------------------------------//

float theta1 = 0.0;
float theta2 = 0.0;

void setup() {
  size(500,500,P3D);
}
void draw() {
  background(0);
  translate(250,250);
  rotateY(theta1);
  
  box(60);
  translate(50,50);
  rotateX(theta2);
  
  box(30);
  theta1 += 0.01;
  theta2 -= 0.01;
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

1.
Write some code that achieves part of your overall program and comment it
Commit this code with a that describes what you added

2.
Repeat

3.
Then at the end (or throughout), don't forget to push your repository to github.com

Don't write your entire exercise and then submit, break it into smaller commits. 
e.g. committing a pre-existing example, then adding one new function and committing, 
then adding a new class and committing, etc. You can't have too many commits. 
You can have too few.
//
//-End----------------------------------------------------------------------------------//
*/