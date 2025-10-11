using System;

public static class Darts
{
    public static int Score(double x, double y)
    {
        var distance = DistanceFromCenter(x, y);

        if (distance > 10)
            return 0;
        if (distance > 5)
            return 1;
        if (distance > 1)
            return 5;
        return 10;
    }

    public static double DistanceFromCenter(double x, double y)
    {
        return Math.Sqrt(Math.Pow(x, 2) + Math.Pow(y, 2));
    }
}
