class Lasagna
{
  public int ExpectedMinutesInOven() => 40;

  public int RemainingMinutesInOven(int minutesAlreadyCooked) => ExpectedMinutesInOven() - minutesAlreadyCooked;

  public int PreparationTimeInMinutes(int layers) => layers * 2;

  public int ElapsedTimeInMinutes(int layers, int minutesAlreadyCooked) => PreparationTimeInMinutes(layers) + minutesAlreadyCooked;
}
