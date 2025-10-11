using System.Linq;

public static class Isogram
{
    public static bool IsIsogram(string word)
    {
        if (word.Length <= 1) return true;

        var ordered = new string(word.ToLower().OrderBy(c => c).ToArray());
        char prev = ordered.First();

        foreach (char c in ordered[1..])
        {
            if (c == prev && c != '-' && c != ' ')
                return false;
            prev = c;
        }

        return true;
    }
}
