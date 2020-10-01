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
  size(1200, 800);
}

void draw()
{
  int count = 0;
  int i = 0;
  Die[] allDice = new Die[30];
  fill(64, 64, 64, 255);
  rect(-50, -50, 1300, 900);
  strokeWeight(7);
  stroke(0);
  rect(20, 20, 760, 650, 7);
  rect(820, 20, 350, 750, 7);
  strokeWeight(3);
  fill(#C0C0C0);
  rect(830, 650, 330, 110, 7);
  rect(830, 30, 330, 60, 7);
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
    text("Total: " + count + " Lucky!", 17, 730);
  } else if (count <= 90) {
    text("Total: " + count + " Unlucky.", 17, 730);
  } else {
    text("Total: " + count, 17, 730);
  }
  text("Grand Total: " + grandTotal, 405, 730);
  text("Roll Distribution", 837, 75);
  textSize(20);
  frames -= 1;
  frameRate(frames);
  text("1s: " + ones, 12, 770);
  text("2s: " + twos, 112, 770);
  text("3s: " + threes, 212, 770);   
  text("4s: " + fours, 312, 770);
  text("5s: " + fives, 412, 770);
  text("6s: " + sixes, 512, 770);
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
  textSize(30);
  if (tot == 0) {
    text("Avg: " + 0, 836, 680);
  } else {
    text("Avg: " + ((float)grandTotal / tot), 836, 680);
  }
  for (int n = 1; n < 7; n++) {
    text(n, 810 + (n * 50), 620);
  }
  if (sixes >= twos && sixes >= threes && sixes >= fours && sixes >= fives && sixes >= ones) {
    text("Most: 6 (" + sixes + ")", 836, 715);
  } else if (fives >= twos && fives >= threes && fives >= fours && fives >= sixes && fives >= ones) {
    text("Most: 5 (" + fives + ")", 836, 715);
  } else if (fours >= twos && fours >= threes && fours >= sixes && fours >= fives && fours >= ones) {
    text("Most: 4 (" + fours + ")", 836, 715);
  } else if (threes >= twos && threes >= fives && threes >= fours && threes >= sixes && threes >= ones) {
    text("Most: 3 (" + threes + ")", 836, 715);
  } else if (twos >= fives && twos >= threes && twos >= fours && twos >= sixes && twos >= ones) {
    text("Most: 2 (" + twos + ")", 836, 715);
  } else if (ones >= twos && ones >= fives && ones >= fours && ones >= sixes && ones >= threes) {
    text("Most: 1 (" + ones + ")", 836, 715);
  } else {
    text("Most: ()", 836, 715);
  }
  if (ones <= twos && ones <= threes &&  ones <= fours && ones <= fives && ones <= sixes) {
    text("Least: 1 (" + ones + ")", 836, 750);
  } else if (twos <= ones && twos <= threes &&  twos <= fours && twos <= fives && twos <= sixes) {
    text("Least: 2 (" + twos + ")", 836, 750);
  } else if (threes <= ones && threes <= twos &&  threes <= fours && threes <= fives && threes <= sixes) {
    text("Least: 3 (" + threes + ")", 836, 750);
  } else if (fours <= ones && fours <= threes &&  fours <= twos && fours <= fives && fours <= sixes) {
    text("Least: 4 (" + fours + ")", 836, 750);
  } else if (fives <= ones && fives <= threes &&  fives <= fours && fives <= twos && fives <= sixes) {
    text("Least: 5 (" + fives + ")", 836, 750);
  } else if (sixes <= ones && sixes <= threes &&  sixes <= fours && sixes <= fives && sixes <= twos) {
    text("Least: 6 (" + sixes + ")", 836, 750);
  } else {
    text("Least: ()", 836, 715);
  }
  line(845, 583, 1145, 583);
  if (ones >= 310) {
    fill(255, 128, 0, 150);
    strokeWeight(0);
    rect(845, 580, 50, -ones);
  } else {
    fill(255, 128, 0, 150);
    strokeWeight(0);
    rect(845, 580, 50, -ones * 2); //ones graph line
  }
  if (twos >= 310) {
    fill(255, 0, 0, 150);
    strokeWeight(0);
    rect(895, 580, 50, -twos);
  } else {
    fill(255, 0, 0, 150);
    strokeWeight(0);
    rect(895, 580, 50, -twos * 2); //twos graph line
  }
  if (threes >= 310) {
    fill(127, 0, 255, 150);
    strokeWeight(0);
    rect(945, 580, 50, -threes);
  } else {
    fill(127, 0, 255, 150);
    strokeWeight(0);
    rect(945, 580, 50, -threes * 2); //threes graph line
  }
  if (fours >= 310) {
    fill(0, 128, 255, 150);
    strokeWeight(0);
    rect(995, 580, 50, -fours);
  } else {
    fill(0, 128, 255, 150);
    strokeWeight(0);
    rect(995, 580, 50, -fours * 2); //fours graph line
  }
  if (fives >= 310) {
    fill(0, 255, 0, 150);
    strokeWeight(0);
    rect(1045, 580, 50, -fives);
  } else {
    fill(0, 255, 0, 150);
    strokeWeight(0);
    rect(1045, 580, 50, -fives * 2); //fives graph line
  }
  if (sixes >= 310) {
    fill(255, 255, 0, 150);
    strokeWeight(0);
    rect(1095, 580, 50, -sixes);
  } else {
    fill(255, 255, 0, 150);
    strokeWeight(0);
    rect(1095, 580, 50, -sixes * 2); //sixes graph line
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
