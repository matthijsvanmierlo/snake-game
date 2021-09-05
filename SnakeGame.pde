/**
 Snake implementation in Processing
 SnakeGame class for game state etc.
 By: Matthijs van Mierlo
 Date: 9/5/2021
 */
class SnakeGame
{

  ArrayList<BodyPart> body = new ArrayList<>();
  Direction d;
  int frames;
  Food f;
  int score = 0;
  boolean gameRunning;

  /**
   Constructor for SnakeGame
   Initializes frames, direction, body, and food
   */
  public SnakeGame()
  {
    frames = 1;
    gameRunning = false;
    d = Direction.RIGHT;
    body.add(new BodyPart(width / 2, height / 2));
    f = new Food();
  }

  /**
   eat() method for snake if snake overlaps with food
   Method adds a BodyPart in the ArrayList for body...
   */
  public void eat()
  {
    BodyPart tempHead = body.get(0);
    Food tempFood = f;
    float distBetween = dist(tempHead.x, tempHead.y, tempFood.x, tempFood.y);
    if (distBetween <= SIZE)
    {
      f = new Food();
      BodyPart head = body.get(0);
      BodyPart newPart = new BodyPart(head.x, head.y);
      body.add(1, newPart);
      score += 1;
    }
  }

  /**
   update() method only updates the snake's pos if a certain number
   of frames has past... this ensures the game
   can speed up and slow down when needed...
   */
  public void update()
  {
    frames += 1;
    if (frames > 5)
    {
      // Remove from the end, append to the front
      BodyPart temp = body.get(body.size() - 1);
      BodyPart head = body.get(0);
      BodyPart tail = new BodyPart(temp.x, temp.y);
      tail.x = head.x;
      tail.y = head.y;
      switch(d) {
      case UP:
        tail.y -= SIZE;
        break;
      case DOWN:
        tail.y += SIZE;
        break;
      case LEFT:
        tail.x -= SIZE;
        break;
      case RIGHT:
        tail.x += SIZE;
        break;
      }
      body.remove(body.size() - 1);
      body.add(0, tail);
      frames = 0;
      eat();
      checkEnd();
    }
  }

  public void checkEnd()
  {
    for (int i = 0; i < body.size() - 1; i++)
    {
      for (int j = i + 2; j < body.size(); j++)
      {
        BodyPart temp1 = body.get(i);
        BodyPart temp2 = body.get(j);
        if (temp1.x == temp2.x && temp1.y == temp2.y)
        {
          // Game over
          gameRunning = false;
          score = 0;
          d = Direction.RIGHT;
          body = new ArrayList<>();
          body.add(new BodyPart(width / 2, height / 2));
          f = new Food();
        }
      }
    }
    BodyPart head = body.get(0);
    if (head.x < 0 || head.x + SIZE > width || head.y < 0 || head.y + SIZE > height)
    {
      gameRunning = false;
      score = 0;
      d = Direction.RIGHT;
      body = new ArrayList<>();
      body.add(new BodyPart(width / 2, height / 2));
      f = new Food();
    }
  }

  public void show()
  {
    for (BodyPart part : body)
    {
      part.show();
    }
    f.show();
  }
}
