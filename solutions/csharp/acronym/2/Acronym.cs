using System.Linq;

public static class Acronym
{
    public static string Abbreviate(string phrase)
    {
        char[] separators = { ' ', '-', '_' };
        return string.Join("", phrase.Split(separators, System.StringSplitOptions.RemoveEmptyEntries)
            .Select(word => word[0].ToString().ToUpper()));
    }
}
