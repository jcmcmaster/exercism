using System;
using System.Collections.Generic;
using System.Linq;

public static class Pangram
{
    public static bool IsPangram(string input)
    {
        HashSet<char> hash = new();

        foreach (var c in input)
            if (char.IsLetter(c))
                hash.Add(Char.ToLower(c));

        var alphabet = "abcdefghijklmnopqrstuvwxyz";

        return new string(hash.OrderBy(c => c).ToArray()) == alphabet;
    }
}
