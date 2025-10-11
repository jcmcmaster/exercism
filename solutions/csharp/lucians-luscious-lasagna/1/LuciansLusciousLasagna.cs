class Lasagna
{
  const int COOK_MINUTES = 40;
  const int PREP_MINUTES_PER_LAYER = 2;

  public int ExpectedMinutesInOven()
  {
    return COOK_MINUTES;
  }

  public int RemainingMinutesInOven(int alreadyIn)
  {
    return COOK_MINUTES - alreadyIn;
  }

  public int PreparationTimeInMinutes(int layers)
  {
    return PREP_MINUTES_PER_LAYER * layers;
  }

  public int ElapsedTimeInMinutes(int layers, int alreadyIn)
  {
    return PreparationTimeInMinutes(layers) + alreadyIn;
  }
}
