class Object
{
  //member variables
  int x,y;//position
  int speedY=1;//moves down screen
  
  Object(int x,int y) {
    this.x=x;
    this.y=y;
  }
    void move()
    {
      this.y=this.y+speedY;
      //if (this.y<width) 
      //this.y = width;
    }
    
    void draw()
    {
      fill(10,50,200);
      triangle(x,y,x,y,x,y);
    }
  
  void update(){
    move();
    draw();
  }
  
}
