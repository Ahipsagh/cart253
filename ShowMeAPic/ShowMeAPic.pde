PImage img;
void setup()
{
size (50,50);
img = loadImage("fish0.png");

}

void draw() 
{
background(0);
image(img,0,0);
}