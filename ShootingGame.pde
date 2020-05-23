float bullet1X; float bullet2X; float bullet3X; float bullet4X; float bullet5X; float bullet6X; float bullet7X; float bullet8X;
float bullet1Y; float bullet2Y; float bullet3Y; float bullet4Y; float bullet5Y; float bullet6Y; float bullet7Y; float bullet8Y;
float bulletSpeed;
boolean title = true;
long prevMillis;
int blinkTime = 500; // blink time in ms
int blinkOnOff = 1;
boolean introScreen = true;
int bulletFired;
int score=0;
int lives=3;
int bulletCount=8;
PImage terrorist;
PImage background1;
PImage rifle;
float terroristX;
float terroristY;
 
void setup() {
  size(1300,750);
  background(255);
  smooth();
     
  bulletFired = 0;
  bulletSpeed = 100;
   
  background1 = loadImage("desert.png");
  terrorist = loadImage("terrorist.png");
  rifle = loadImage("rifle.png");
   
  terroristX = width+100;
  terroristY = random(height);
}
void draw() {
  if (introScreen) {
title(); // another custom function
}

// otherwise, play as usual
else {

  cursor(CROSS);
  imageMode(CORNER);
  image(background1, 0, 0, width, height);
  imageMode(CENTER);
  image(terrorist, terroristX, terroristY, 120, 120); 
  terroristX = terroristX-35;
   
  //reset terrorist
  if(terroristX<0)
  {
   terroristX=width+100;
   terroristY=random(height);
   lives--;
  }
  
  // bullets fired conditions
  if(bulletFired<1)
 {
  bullet1X=mouseX+170;
  bullet1Y=mouseY-8;
 }
 else
 {
  bullet1X=bullet1X+bulletSpeed;
 }
   if(bulletFired<2)
 {
  bullet2X=mouseX+170;
  bullet2Y=mouseY-8;
 }
 else
 {
  bullet2X=bullet2X+bulletSpeed;
 }
   if(bulletFired<3)
 {
  bullet3X=mouseX+170;
  bullet3Y=mouseY-8;
 }
 else
 {
  bullet3X=bullet3X+bulletSpeed;
 }
   if(bulletFired<4)
 {
  bullet4X=mouseX+170;
  bullet4Y=mouseY-8;
 }
 else
 {
  bullet4X=bullet4X+bulletSpeed;
 }
   if(bulletFired<5)
 {
  bullet5X=mouseX+170;
  bullet5Y=mouseY-8;
 }
 else
 {
  bullet5X=bullet5X+bulletSpeed;
 }
   if(bulletFired<6)
 {
  bullet6X=mouseX+170;
  bullet6Y=mouseY-8;
 }
 else
 {
  bullet6X=bullet6X+bulletSpeed;
 } 
   if(bulletFired<7)
 {
  bullet7X=mouseX+170;
  bullet7Y=mouseY-8;
 }
 else
 {
  bullet7X=bullet7X+bulletSpeed;
 }
   if(bulletFired<8)
 {
  bullet8X=mouseX+170;
  bullet8Y=mouseY-8;
 }
 else
 {
  bullet8X=bullet8X+bulletSpeed;
 }
 //reload bullets
 if(bulletFired==9)
 {
 bulletFired=0;
 }
  
 // code to check for contact with terrorist image with each bullet
 if( (bullet1X>=terroristX-50&&bullet1X<=terroristX+50&&bullet1Y>=terroristY-50&&bullet1Y<=terroristY+50) ||
   (bullet2X>=terroristX-50&&bullet2X<=terroristX+50&&bullet2Y>=terroristY-50&&bullet2Y<=terroristY+50) ||
   (bullet3X>=terroristX-50&&bullet3X<=terroristX+50&&bullet3Y>=terroristY-50&&bullet3Y<=terroristY+50) ||
   (bullet4X>=terroristX-50&&bullet4X<=terroristX+50&&bullet4Y>=terroristY-50&&bullet4Y<=terroristY+50) ||
   (bullet5X>=terroristX-50&&bullet5X<=terroristX+50&&bullet5Y>=terroristY-50&&bullet5Y<=terroristY+50) ||
   (bullet6X>=terroristX-50&&bullet6X<=terroristX+50&&bullet6Y>=terroristY-50&&bullet6Y<=terroristY+50) ||
   (bullet7X>=terroristX-50&&bullet7X<=terroristX+50&&bullet7Y>=terroristY-50&&bullet7Y<=terroristY+50) ||
   (bullet8X>=terroristX-50&&bullet8X<=terroristX+50&&bullet8Y>=terroristY-50&&bullet8Y<=terroristY+50))
 {
   score++; //score/kills increases
   terroristX=width+50;
   terroristY=random(height); //each time terrorist is hit, reappears and a random height
 }
 
  image( rifle,mouseX+50,mouseY);
  strokeWeight(5);
  fill(255);
  line(100,140,100,375);
  line(100,375,65,500);
  line(100,375,135,500);
  fill(0);
  fill(#3F2EAF);
  ellipse(100,59,100,90);
  ellipse(100,65,145,40);
  fill(245,184,87);
  ellipse(100,100,93,100);
  line(100,250,mouseX+65,mouseY+10);
  line(100,220,mouseX+5,mouseY+5);
  strokeWeight(13);
  point(83,80);
  point(117,80);
  strokeWeight(3);
  fill(#F73441);
  ellipse(100,120,30,10);
  strokeWeight(3);
   
 //bullets
 fill(0);
  ellipse(bullet1X, bullet1Y,3,3);
  ellipse(bullet2X, bullet2Y,3,3);
  ellipse(bullet3X, bullet3Y,3,3);
  ellipse(bullet4X, bullet4Y,3,3);
  ellipse(bullet5X, bullet5Y,3,3);
  ellipse(bullet6X, bullet6Y,3,3);
  ellipse(bullet7X, bullet7Y,3,3);
  ellipse(bullet8X, bullet8Y,3,3);
  fill(0);
  textSize(36);
  text("Kills: "+score, width/2, 30);
  text("Lives: "+lives, width/3,30);
  
  //Gameover
  if(lives==0) {
   background(200);
   textSize(200);
   text("You Lose!",130,500);
   noLoop();
  }

}
}
 
void mousePressed() {
  bulletFired++;
  bulletSpeed=100;
}

void title() {
// fill screen black
fill(0);
rect(0,0, width,height);

fill(255);
textSize(60);
text("SHOOT THE TERRORISTS\n\n\n\n", width/5, height/4);

// check if the blink time has passed, then turn on or off
if (millis() >= prevMillis + blinkTime) {
blinkOnOff *= -1; // switch between -1 and 1
prevMillis = millis(); // set for next time interval
}
if (blinkOnOff == 1) { // if the blink is 1
text("[ press return/enter to start ]", width/5, 600); // show the text
}


// check if return/enter is pressed, and if so play the game!
if (keyPressed) {
  if (key == ENTER || key == RETURN) {
      introScreen = false;
      }
   }
}
