static class AssemblyLine
{
  const int CarsPerHour = 221;

  public static double SuccessRate(int speed)
  {
    if (speed == 0)
      return 0;
    else if (speed <= 4)
      return 1;
    else if (speed <= 8)
      return .9;
    else if (speed == 9)
      return .8;
    return .77;
  }

  public static double ProductionRatePerHour(int speed) =>
    speed * CarsPerHour * SuccessRate(speed);

  public static int WorkingItemsPerMinute(int speed) =>
    (int)ProductionRatePerHour(speed) / 60;
}
