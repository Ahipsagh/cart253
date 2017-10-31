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