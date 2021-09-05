/**
 Snake implementation in Processing
 BodyPart class for snake...
 By: Matthijs van Mierlo
 Date: 9/5/2021
 */
class BodyPart
{
  int x;
  int y;
  int size;

  public BodyPart(int x, int y)
  {
    this.x = x;
    this.y = y;
  }

  public void show()
  {
    fill(255, 0, 0);
    rect(x, y, SIZE, SIZE);
  }
}
