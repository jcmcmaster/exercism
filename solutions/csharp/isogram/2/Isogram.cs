using System.Linq;

public static class Isogram
{
    public static bool IsIsogram(string word)
    {
        var repeats = from c in word.ToLower()
                      where char.IsLetter(c)
                      group c by c into g
                      where g.Count() > 1
                      select g;
        return !repeats.Any();
    }
}
