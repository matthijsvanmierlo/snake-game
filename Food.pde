/**
 Snake implementation in Processing
 Food class for snake...
 By: Matthijs van Mierlo
 Date: 9/5/2021
 */
class Food
{
  int x;
  int y;

  public Food()
  {
    x = (int) random(width);
    y = (int) random(height);
  }

  public void show()
  {
    fill(255, 255, 0);
    rect(x, y, SIZE, SIZE);
  }
}
