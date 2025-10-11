using System;

public static class CollatzConjecture
{
    public static int Steps(int number, int stepCount = 0)
    {
        if (number <= 0)
            throw new ArgumentOutOfRangeException(nameof(number));

        if (number == 1)
            return stepCount;

        if (number % 2 == 0)
            return Steps(number / 2, stepCount + 1);

        return Steps(number * 3 + 1, stepCount + 1);
    }
}
