void setup()
{
  background(64, 64, 64);
  size(800, 600);
  noLoop();
}

void draw()
{
  int count = 0;
  fill(64, 64, 64, 255);
  rect(-50, -50, 900, 700);
  strokeWeight(7);
  stroke(0);
  rect(20, 20, 760, 520, 7);
  strokeWeight(3);
  fill(#C0C0C0);
  rect(7, 550, 785, 40, 7);
  for (int x = 100; x < 800; x += 120) {
    for (int y = 100; y < 500; y += 120) { 
      Die bob = new Die(x, y);
      bob.roll();
      bob.show();
      count += bob.rollNum;
    }
  }
  textSize(40);
  if (count >= 100) {
    text("Your total roll is " + count + "! You're lucky!", 12, 585); 
  } else if (count <= 65) {
    text("Your total roll is " + count + ". You're unlucky.", 12, 585);
  } else {
    text("Your total roll is " + count + ".", 12, 585);
  }
}

void mousePressed()
{
  redraw();
}

class Die //models one single dice cube
{
  int myX;
  int myY;
  int rollNum;
  Die(int x, int y) //constructor
  {
    myX = x;
    myY = y;
    rollNum = 1;
  }
  void roll()
  {
    rollNum = (int)((Math.random() * 6) + 1);
  }
  void show()
  {
    fill(64, 64, 64, 255);
    strokeWeight(5);
    stroke((int)((Math.random() * 106) + 150), (int)((Math.random() * 106) + 150), (int)((Math.random() * 106) + 150), 255);
    fill(204, 204, 255, 100);
    rect(myX - 50, myY - 50, 100, 100, 7);
    if (rollNum == 1) {
      fill(0);
      stroke(0);
      ellipse(myX, myY, 20, 20);
    } else if (rollNum == 2){
      fill(0);
      stroke(0);
      ellipse(myX - 20, myY + 20, 20, 20);
      ellipse(myX + 20, myY - 20, 20, 20);
    } else if (rollNum == 3) {
      fill(0);
      stroke(0);
      ellipse(myX - 25, myY + 25, 20, 20);
      ellipse(myX + 25, myY - 25, 20, 20);
      ellipse(myX, myY, 20, 20);
    } else if (rollNum == 4) {
      fill(0);
      stroke(0);
      ellipse(myX - 20, myY - 20, 20, 20);
      ellipse(myX + 20, myY - 20, 20, 20);
      ellipse(myX + 20, myY + 20, 20, 20);
      ellipse(myX - 20, myY + 20, 20, 20);
    } else if (rollNum == 5) {
      fill(0);
      stroke(0);
      ellipse(myX, myY, 20, 20);
      ellipse(myX - 25, myY - 25, 20, 20);
      ellipse(myX + 25, myY - 25, 20, 20);
      ellipse(myX + 25, myY + 25, 20, 20);
      ellipse(myX - 25, myY + 25, 20, 20);
    } else {
      fill(0);
      stroke(0);
      ellipse(myX - 20, myY + 30, 20, 20);
      ellipse(myX - 20, myY - 30, 20, 20);
      ellipse(myX - 20, myY, 20, 20);
      ellipse(myX + 20, myY + 30, 20, 20);
      ellipse(myX + 20, myY - 30, 20, 20);
      ellipse(myX + 20, myY, 20, 20);
    }
  }
}
