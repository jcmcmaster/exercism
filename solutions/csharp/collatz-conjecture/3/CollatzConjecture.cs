using System;

public static class CollatzConjecture
{
    public static int Steps(int number)
    {
        if (number <= 0)
            throw new ArgumentOutOfRangeException(nameof(number));

        int steps = 0;
        int mutableNumber = number;

        while (mutableNumber > 1)
        {
            mutableNumber = mutableNumber switch
            {
                int n when n % 2 == 0 => n / 2,
                int n => n * 3 + 1
            };
            steps++;
        }

        return steps;
    }
}
