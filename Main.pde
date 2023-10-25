PImage background,startScreen,gameOver;
int bgX=0;
int x,y;
int xdirection = 5;  // Left or Right
  int ydirection = 4;  // Top to Bottom

final int PLAYING = 0;
final int FINISHED = 1;

int gameMode = PLAYING;
int gameScreen = 0;
int score;
String name= "Sana";
int SpawnTimer = 0;

ArrayList<Attacker> attackList= new ArrayList();

Player player;
Attacker attacker1,attacker2, attacker3;
Object bullet;

void setup()
{
  size(1000,800);
  frameRate(30);
  
  background = loadImage("houseBackground.png");//set background image
  //image link - https://i.pinimg.com/originals/7c/03/bc/7c03bc7b0935f918ba6a952d6293744f.png
  background.resize(width,height); //set image to be same size as the canvas
  
  startScreen= loadImage("Tom-And-Jerry-StartScreen.jpg");
  //image link - https://www.fortressofsolitude.co.za/wp-content/uploads/2018/10/Tom-And-Jerry.jpg
  startScreen.resize(width,height);
  
  gameOver=loadImage("gameOver.gif");
  //image link - https://th.bing.com/th/id/R.541e87ab71dfa5cd6b6ef61c2fb5fdd3?rik=UshisEojLCVHGw&pid=ImgRaw&r=0
  gameOver.resize(width,height);
  
  player = new Player(width/2,height);
  
  for(int i=0; i<3; i++)
  {
    attackList.add(new Attacker( (int)random(width),height ));
  }
//  println(attackList.size());
}

void draw()
{
   if (gameMode ==PLAYING)
  {
    gameScreen();
    SpawnTimer++;
 //   println(height,width);
    
   // bullet.update();
    
    if(SpawnTimer % 60==0 ){
     attackList.add(new Attacker(  (int)random(width),height ));
    }
       
   if (gameScreen == 0) {
     initScreen();
   } 
  
   else if (gameScreen == 1) 
   {
     gameScreen();
   } 
   else if (gameScreen == 2)
   {
     gameOverScreen();
   }
  }
}

 
 void keyPressed()//allow player to move across screen
{
  if(key==CODED)
  {
    if(keyCode==LEFT)
    {
      player.moveHorizontal(-10);     
    } 
  if(keyCode==RIGHT)
  {
  player.moveHorizontal(10);
  }
  }
     
  if (key == ' ')
   gameOverScreen();
  
  if(key == 'x')
  gameMode = PLAYING;
  //{
  //  if(keyCode==UP)
  //player.moveVertical(-10);
  //}
  //{
  //  if(keyCode==DOWN)
  //player.moveVertical(10);
  //}
  if (gameScreen==0)
  {
    startGame();
  }

}

void initScreen() 
{
  image(startScreen,bgX,0);
  textAlign(CENTER);
  fill(0);
  textSize(25);
  text("Press Enter to start",height-300,width-900); 
  text("Press 'Spacebar' to end game or press 'X' to continue",height-300,width-860);
  text("How to play: Use keys (Left & Right) to catch the mouse and win the game",height-300,width-940);
  // codes of initial screen
}

void gameScreen() // codes of game screen
{ 
  image(background, bgX, 0); //draw image to fill the canvas
  player.render();
  player.move();
 
 for(int i=0; i< attackList.size(); i++) 
 {
   Attacker currentAttacker = attackList.get(i);
   
   currentAttacker.update();
   
 //if player crashed into the current attacker, set gameMode to FINISHED  
 if (player.crash( currentAttacker ) ||currentAttacker.x <-100  ) 
  { 
    attackList.remove(i);
  }
 }
// println(attackList.size() );//shows how many attackers are on the screen.
}

void gameOverScreen() 
{
 gameMode=FINISHED;
 // gameScreen=2;
 image(gameOver,bgX,0); // codes for game over screen
 textSize(15);
 text("Press'X' to Continue",height/2,width/2+10);
}

void startGame() 
{
  gameScreen=1;
}
