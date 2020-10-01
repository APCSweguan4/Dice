int frames = 120;
int grandTotal = 0;
int ones = 0;
int twos = 0;
int threes = 0;
int fours = 0;
int fives = 0;
int sixes = 0;
int tot = 0;
void setup()
{
  background(64, 64, 64);
  size(800, 800);
}

void draw()
{
  int count = 0;
  int i = 0;
  Die[] allDice = new Die[30];
  fill(64, 64, 64, 255);
  rect(-50, -50, 900, 900);
  strokeWeight(7);
  stroke(0);
  rect(20, 20, 760, 650, 7);
  strokeWeight(3);
  fill(#C0C0C0);
  rect(7, 680, 785, 100, 7);
  for (int x = 100; x < 800; x += 120) {
    for (int y = 100; y < 700; y += 120) {
      allDice[i] = new Die(x, y);
      allDice[i].roll();
      allDice[i].show();
      count += allDice[i].rollNum;
      i++;
    }
  }
  textSize(40);
  if (count >= 120) {
    text("Total: " + count + " Lucky!", 12, 720);
  } else if (count <= 90) {
    text("Total: " + count + " Unlucky.", 12, 720);
  } else {
    text("Total: " + count, 12, 720);
  }
  text("Grand Total: " + grandTotal, 400, 720);
  textSize(20);
  frames -= 1;
  frameRate(frames);
  text("1's: " + ones, 12, 770);
  text("2's: " + twos, 112, 770);
  text("3's: " + threes, 212, 770);   
  text("4's: " + fours, 312, 770);
  text("5's: " + fives, 412, 770);
  text("6's: " + sixes, 512, 770);
  text("Total Dice: " + tot, 612, 770);
  if (frames == 0) {
    noLoop();
    for (int s = 0; s < 30; s++) {
      if (allDice[s].rollNum == 1) {
        ones++;
      } else if (allDice[s].rollNum == 2) {
        twos++;
      } else if (allDice[s].rollNum == 3) {
        threes++;
      } else if (allDice[s].rollNum == 4) {
        fours++;
      } else if (allDice[s].rollNum == 5) {
        fives++;
      } else if (allDice[s].rollNum == 6) {
        sixes++;
      }
    }
    grandTotal += count;
    frames = 120;
    frameRate(120);
    tot += 30;
  }
}

void mousePressed()
{
  loop();
}

void keyPressed()
{
  loop();
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
    if (rollNum == 6) {
      fill(255, 223, 0, 150);
      rect(myX - 50, myY - 50, 100, 100, 7);
    } else {
      fill(204, 204, 255, 100);
      rect(myX - 50, myY - 50, 100, 100, 7);
    }
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
