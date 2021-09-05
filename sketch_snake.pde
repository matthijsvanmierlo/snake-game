/**
 Snake implementation in Processing
 By: Matthijs van Mierlo
 Date: 9/5/2021
 */

////////////////////////////////////////////////////////
// Variables go here...
////////////////////////////////////////////////////////
SnakeGame s;

// Constants
enum Direction
{
  LEFT,
    RIGHT,
    UP,
    DOWN
}

final int SIZE = 10;

void setup()
{
  size(500, 500);
  s = new SnakeGame();
}

void keyPressed()
{
  if (keyPressed)
  {
    switch(keyCode)
    {
    case UP:
      s.d = Direction.UP;
      println("UP");
      break;
    case DOWN:
      s.d = Direction.DOWN;
      println("DOWN");
      break;
    case LEFT:
      s.d = Direction.LEFT;
      println("LEFT");
      break;
    case RIGHT:
      s.d = Direction.RIGHT;
      println("RIGHT");
      break;
    case ENTER:
      s.gameRunning = !s.gameRunning;
      break;
    }
  }
}

void draw()
{
  background(0);
  if (s.gameRunning)
  {
    s.update();
    s.show();
    fill(255);
    textSize(15);
    text(String.format("Current Score: %d", s.score), 50, 50);
  } else
  {
    fill(255);
    textSize(50);
    text("Snake v1.0", 100, width / 5);
    textSize(25);
    text("Game Paused...", 100, 300 + width / 10);
    text(String.format("Current Score: %d", s.score), 100, 300 + 2 * width / 10);
  }
}
