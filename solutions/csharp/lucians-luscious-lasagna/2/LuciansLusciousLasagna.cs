class Lasagna
{
  const int COOK_MINUTES = 40;
  const int PREP_MINUTES_PER_LAYER = 2;

  public int ExpectedMinutesInOven() => COOK_MINUTES;

  public int RemainingMinutesInOven(int alreadyIn) =>
    ExpectedMinutesInOven() - alreadyIn;

  public int PreparationTimeInMinutes(int layers) =>
    PREP_MINUTES_PER_LAYER * layers;

  public int ElapsedTimeInMinutes(int layers, int alreadyIn) =>
    PreparationTimeInMinutes(layers) + alreadyIn;
}
