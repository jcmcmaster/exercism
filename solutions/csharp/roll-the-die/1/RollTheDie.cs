using System;

public class Player
{
  Random random = new();

  public int RollDie() => random.Next(17) + 1;

  public double GenerateSpellStrength() => random.NextDouble() * 100;
}
