using System;
using System.Linq;
using System.Collections.Generic;

public static class NucleotideCount
{
    private static readonly char[] Nucleotides = new[] { 'A', 'C', 'G', 'T' };

    public static IDictionary<char, int> Count(string sequence)
    {
        Dictionary<char, int> counts = new();

        foreach (char n in Nucleotides)
            counts.Add(n, 0);

        foreach (char n in sequence)
        {
            if (!Nucleotides.Contains(n))
                throw new ArgumentException();
            counts[n]++;
        }

        return counts;
    }
}
