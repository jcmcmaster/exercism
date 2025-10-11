using System.Linq;

public static class Pangram
{
    public static bool IsPangram(string input)
    {
        var alphabet = "abcdefghijklmnopqrstuvwxyz";
        input.ToLower()
            .ToList()
            .ForEach(x => alphabet = alphabet.Replace(x.ToString(), string.Empty));
        return alphabet.Length == 0;
    }
}
