using System.Collections.Generic;
using System.Linq;

public static class SumOfMultiples
{
    public static int Sum(IEnumerable<int> multiples, int max)
    {
        List<int> mults = new();

        foreach (int m in multiples)
        {
            if (m == 0)
                continue;

            int orig = m, cur = m;
            while (cur < max)
            {
                mults.Add(cur);
                cur += orig;
            }
        }

        return mults.Distinct().Sum();
    }
}
