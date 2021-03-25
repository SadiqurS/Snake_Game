//Sadiqur Sakib Period 5
//Snake Game 

int angle=0;//variable for the project
int snake=5;
int time=0;

int[] headx= new int[2500];
int[] heady= new int[2500];

int foodx=(round(random(47))+1)*8;//random x coord for the food
int foody=(round(random(47))+1)*8;//random y coord for the food

boolean redo=true;
boolean stop=false;            

void setup()//the Field
{
  restart();
  size(600,600);            
  textAlign(CENTER);
}

void draw()
{
  if (stop)          
  {
  }
  
  else
  {
  time+=1;
  fill(255,0,0);//food
  stroke(0);
  rect(foodx,foody,8,8);
  fill(0);
  stroke(0);
  rect(0,0,width,8);
  rect(0,height-8,width,8);
  rect(0,0,8,height);
  rect(width-8,0,8,height);        
  
  if ((time % 5)==0)
  {
    travel();
    display();
    check();              
  }
  }
}

void keyPressed()  //controls W A S D AND ENTER                  
{
  if (keyPressed)
  {
    if (key== 'w' && angle!=270 && (heady[1]-8)!=heady[2])
    {
      angle=90;
    }
    else if (key == 's' && angle!=90 && (heady[1]+8)!=heady[2])
    {
      angle=270;
    }
    else if (key == 'a' && angle!=0 && (headx[1]-8)!=headx[2])
    {
      angle=180;
    }
    else if (key == 'd' && angle!=180 && (headx[1]+8)!=headx[2])
    {
      angle=0;
    }
    if (key == ENTER)
    {
      restart();
    }
  }
}

void travel()
{
  for(int i=snake;i>0;i--)             // loop for snake.
  {
    if (i!=1)
    {
      headx[i]=headx[i-1];
      heady[i]=heady[i-1];
    }
    else
    {
      switch(angle)
      {
        case 0:
        headx[1]+=8;
        break;
        case 90:
        heady[1]-=8;
        break;
        case 180:
        headx[1]-=8;
        break;
        case 270:
        heady[1]+=8;
        break;
      }
    }
  }
  
}

void display()            // displays the snake and apple.
{
  if (headx[1]==foodx && heady[1]==foody)
  {
    snake+=round(random(1)+1);
    redo=true;
    while(redo)
    {
      foodx=(round(random(47))+1)*8;
      foody=(round(random(47))+1)*8;
      for(int i=1;i<snake;i++)
      {     
        if (foodx==headx[i] && foody==heady[i])
        {
          redo=true;
        }
        else
        {
          redo=false;
          i=1000;
        }
      }
    }
  }
  stroke(0,153,0);
  fill(0,255,255);
  rect(headx[1],heady[1],8,8);
  fill(0,153,0);
  rect(headx[snake],heady[snake],8,8);
}

void check()          //endgame display and check
{
  for(int i=2;i<=snake;i++)
  {
    if (headx[1]==headx[i] && heady[1]==heady[i])
    {
      fill(0);
      rect(125,125,160,100);
      fill(255);
      text("GAME OVER",200,150);
      text("Score:  "+str(snake-1),200,175);
      text("Press Enter to RESTART",200,200);
      stop=true;
    }
    if (headx[1]>=(width-8) || heady[1]>=(height-8) || headx[1]<=0 || heady[1]<=0)
    {
      fill(0);
      rect(220,225,160,100);
      fill(255);
      text("GAME OVER",300,250);
      text("Score:  "+str(snake-1),300,275);
      text("Press Enter to RESTART",300,300);
      stop=true;
    }
  }
}
void restart()        //press Enter then the game is restarted
{
  background(0,153,0);
  headx[1]=200;
  heady[1]=200;
  for(int i=2;i<1000;i++)
  {
    headx[i]=0;
    heady[i]=0;
  }
  stop=false;
  foodx=(round(random(47))+1)*8;
  foody=(round(random(47))+1)*8;
  snake=5;
  time=0;
  angle=0;
  redo=true;
}
