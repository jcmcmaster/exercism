using System.Linq;

public static class Acronym
{
    public static string Abbreviate(string phrase)
    {
        string cleansed = string.Concat(
                phrase.Where(c => c == ' ' || c == '-' || char.IsLetter(c)));
        return string.Concat(
            from g in cleansed.Split(' ', '-')
            where g.Length > 0
            select char.ToUpper(g.First()));
    }
}
