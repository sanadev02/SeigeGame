class Attacker {
  
  //member variables
  int x,y; //position
  int size;
  int width;
  
  int speedX=1;
  int speedY=1;
  
  int xdirection = 1;  // Left or Right
  int ydirection = 1;  // Top to Bottom
  
  int animationCounter=0;  
  PImage img1,img2,img3,img4;

  
  //constructors- load images
  Attacker(int x, int y) {
    this.x = x;
    this.y = y;
    img1 =loadImage("jerry1.png");
    //image link - https://i.pinimg.com/236x/ad/86/5c/ad865cd6584cbdc8fb4e09922c3d72b3--bead-patterns-stitch-patterns.jpg
    img2 =loadImage("jerry3.png");//loads from .pde source code directory
    img3 =loadImage("jerry4.png");
    img4= loadImage("jerry2.png");
  }
  
  //methods- draw alien
   void render(){
 if (animationCounter >0 & animationCounter<=15)
        { image(img1,this.x,this.y);}
    else if (animationCounter >15 & animationCounter<=30)
        { image(img2,this.x,this.y);}
    else if (animationCounter >30 & animationCounter<=45)
        { image(img4,this.x,this.y);}
    else
        { image(img3,this.x,this.y);}
        
       animationCounter = animationCounter +1;
        if (animationCounter >60)
           animationCounter = 0;
           
   }  
   
   void move()
   {  
     this.y=this.y-speedY;
      if (this.y<width) 
      this.y = -img1.width;           
   }
 
 void crash()//collision function
{
  if(abs( dist(player.x, player.y, x, y))<20)
  {
    //this.x=x;
    y=800;// attacker will respawn at this location after collision
  }
}
 
 void update()// simplify code by adding move and render into one method.
 {
  //crash();
  move();
  render();
 }
}//end of class
