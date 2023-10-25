class Player 
{
 //member variables
  int x,y;//position
  int size;
  
  int speedX = 2;
  int speedY = 2;
  
  
  int xdirection = 5;  // Left or Right
  int ydirection = 4;  // Top to Bottom
  
  PImage img1;
  
  //constructor-load image
  Player(int x, int y) 
  {
   this.x = x;
   this.y = y/2;
   img1 =loadImage("cat1.png");//image link- https://cdn.shopify.com/s/files/1/0822/1983/articles/tom-cat-pixel-art-pixel-art-tom-cat-tom-and-jerry-fictional-character-cartoon-thomas-pixel-8bit_1024x1024.png?v=1501229219
   this.size=size*2;
  }
  
  //method - draw defender
  void render() 
  {
  image(img1,this.x,this.y);
  }
  
  void move()
  {
   if (player.x > width-30)// set boundaries //<>//
     {
      // println("im here",player.x );
     player.x=width-30; //if image doesn't bounce back times by -1 to reverse direction.
     }
     else if ( player.x<width-1000){
    //  println("here",player.x);
       player.x= width-1000;
     }
  }
  
  //method - move defender
  void moveHorizontal(int direction)
  {
    x=x+direction;//moves away from aliens
  } 
  void moveVertical (int direction)
  {
    y=y+direction;
  }
  
 boolean crash( Attacker attackList) {
    return abs(this.x-attackList.x) <20 && abs (this.y - attackList.y) <20;
  }
}//end of class
