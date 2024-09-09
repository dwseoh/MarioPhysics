PImage LJ,RJ,LS,RS,LSkid,RSkid,LW1,LW2,LW3,RW1,RW2,RW3,Back;
float x = 100;
float y =0 ;
float xa=0,ya=0;
int jumpTime = 0;
boolean rPress = false;
boolean lPress = false;
boolean uPress = false;
boolean sPress = false;
boolean skid = false;
int dir = -1;
int counter = 0;
int modu = 0;
int changedir = 0;
float sideSpeed = 0;
boolean onGround = true;

void setup(){
  
  size(600, 385);
  imports();
  frameRate(30);
}

void draw(){
  
  background(Back);
  
    // Update position based on current velocity
  x += xa;
  y += ya;
  
  // Damp velocity due to friction
  xa *= 0.89;
  ya *= 0.85;
  
  // Gravitational acceleration
  if (!onGround) {
    ya += 3.0;
  }
  
  if (changedir != 0) {
    changedir -= 1;
    if (sPress){
      skid = true;
    }
    else{
      
    }
  }
  else{
    skid = false;
  }
  
  
  if (y>=0) {
    onGround = true;
    y = 0;
    ya = 0;
    jumpTime = 0;
    
  }
  else {
    onGround = false;
  }
  
  println(uPress,onGround,y,ya,jumpTime);
  if (uPress){
    if (onGround){
      if (jumpTime <1){
        jumpTime = 10;    // begin jumping
        ya = -1.7 * jumpTime;
      }
    }
    else if (jumpTime > 0) {
      ya = -1.7 * jumpTime;
      jumpTime--;
    }
  }
  
  
    
  if (sPress) {
    sideSpeed = 1.2;
  }
  else {
    sideSpeed = 0.6;
  }
  
  

  
  
  if (lPress){
    xa -= sideSpeed;
    if (onGround){
      dir = 1;
    }
  }
  else if (rPress) {
    xa += sideSpeed;
    if (onGround){
      dir = -1;
    }
  }


  if (skid && onGround) {
    if (dir == -1) {
      image(LSkid,x,y+272,64/1.18,64/1.18);
    }
    else{
      image(RSkid,x,y+272,64/1.18,64/1.18);
    }
    
  }
  else if (onGround && floor(abs(xa)) == 0 ){
    if (dir == -1) {
      image(RS,x,y+272,64/1.18,64/1.18);
    }
    else{
      image(LS,x,y+272,64/1.18,64/1.18);
    }
  }
  else if (onGround && abs(xa) >0){
    println("loop",xa,abs(xa));
    counter +=1;
    modu = counter%9;
    if(dir==-1){
      println("rightwalking",counter);
      if (0<=modu && modu <=2){
        image(RW1,x,y+272,64/1.18,64/1.18);
      }
      else if (3<=modu && modu <=5){
        image(RW2,x,y+272,64/1.18,64/1.18);
      }
      else if (6<=modu && modu <=8){
        image(RW3,x,y+272,64/1.18,64/1.18);
      }
      
    }
    else{
      println("leftwalking",counter);
      if (0<=modu && modu <=2){
        image(LW1,x,y+272,64/1.18,64/1.18);
      }
      else if (3<=modu && modu <=5){
        image(LW2,x,y+272,64/1.18,64/1.18);
      }
      else if (6<=modu && modu <=8){
        image(LW3,x,y+272,64/1.18,64/1.18);
      }
    }
  }
  else{
      if (dir==-1){
        image(RJ,x,y+272,64/1.18,64/1.18);
      }
      else{
        image(LJ,x,y+272,64/1.18,64/1.18);
      }
  }
  
}
  
  


void keyPressed(){
  if (key == CODED){
    if (keyCode == UP){
      uPress = true;
    }
    if (keyCode == RIGHT){
      rPress = true;
    }
    if (keyCode == LEFT){
      lPress = true;
    }
    
  }
  if (key == 's') {
    sPress = true;
  }
  
}

void keyReleased(){
  if (key == CODED){
    if (keyCode == UP){
      uPress = false;
    }
    if (keyCode == RIGHT){
      rPress = false;
      if (lPress){
        changedir = 10;
      }
    }
    if (keyCode == LEFT){
      lPress = false;
      if (rPress){
        changedir = 10;
      }
    }  
  }
  if (key == 's') {
    sPress = false;
  }
}


void imports() {
 
  Back = loadImage("Back.png");
  Back.resize(600,385);
  LJ = loadImage("LJ.png");
  RJ = loadImage("RJ.png");
  LS = loadImage("LS.png");
  RS = loadImage("RS.png");
  LSkid = loadImage("LSkid.png");
  RSkid = loadImage("RSkid.png");
  LW1 = loadImage("LW1.png");
  LW2 = loadImage("LW2.png");
  LW3 = loadImage("LW3.png");
  RW1 = loadImage("RW1.png");
  RW2 = loadImage("RW2.png");
  RW3 = loadImage("RW3.png");
  

}
