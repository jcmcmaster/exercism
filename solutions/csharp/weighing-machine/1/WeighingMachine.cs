using System;

class WeighingMachine
{
  private double _weight;

  public WeighingMachine(int precision)
  {
    Precision = precision;
  }

  public int Precision { get; private set; }

  public double Weight
  {
    get => _weight;
    set
    {
      if (value < 0)
        throw new ArgumentOutOfRangeException();
      _weight = Math.Round(value, Precision);
    }
  }

  public double TareAdjustment { get; set; } = 5.0;

  public string DisplayWeight
  {
    get
    {
      string formatter = $"F{Precision}";
      return $"{(Weight - TareAdjustment).ToString(formatter)} kg";
    }
  }
}
