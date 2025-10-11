using System;

class RemoteControlCar
{
  private int _speed;
  private int _batteryDrain;
  private int _batteryRemaining;
  private int _distanceDriven;

  public RemoteControlCar(
      int speed,
      int batteryDrain)
  {
    _speed = speed;
    _batteryDrain = batteryDrain;
    _batteryRemaining = 100;
    _distanceDriven = 0;
  }

  public bool BatteryDrained() => _batteryRemaining < _batteryDrain;

  public int DistanceDriven() => _distanceDriven;

  public void Drive()
  {
    if (!BatteryDrained())
    {
      _batteryRemaining -= _batteryDrain;
      _distanceDriven += _speed;
    }
  }

  public static RemoteControlCar Nitro() => new RemoteControlCar(50, 4);
}

class RaceTrack
{
  private int _distance;

  public RaceTrack(int distance)
  {
    _distance = distance;
  }

  public bool TryFinishTrack(RemoteControlCar car)
  {
    while (!car.BatteryDrained())
    {
      car.Drive();
    }

    return car.DistanceDriven() >= _distance;
  }
}
