class RemoteControlCar
{
  int _metersTraveledSinceCharge = 0;
  int _batteryPercentageRemaining = 100;

  public static RemoteControlCar Buy() => new RemoteControlCar();

  public string DistanceDisplay() =>
    $"Driven {_metersTraveledSinceCharge} meters";

  public string BatteryDisplay() =>
    _batteryPercentageRemaining == 0
      ? "Battery empty"
      : $"Battery at {_batteryPercentageRemaining}%";

  public void Drive()
  {
    if (_batteryPercentageRemaining > 0)
    {
      _metersTraveledSinceCharge += 20;
      _batteryPercentageRemaining--;
    }
  }
}
