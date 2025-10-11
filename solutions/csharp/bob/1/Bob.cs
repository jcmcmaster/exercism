using System.Text.RegularExpressions;

public static class Bob
{
    public static string Response(string statement) =>
        statement.Trim() switch
        {
            string s when s.EndsWith('?') && IsYelling(s) => "Calm down, I know what I'm doing!",
            string s when s.EndsWith('?') => "Sure.",
            string s when IsYelling(s) => "Whoa, chill out!",
            string s when s == string.Empty => "Fine. Be that way!",
            _ => "Whatever."
        };

    private static bool IsYelling(string s)
    {
        Regex anyLetters = new Regex(@"[a-zA-Z]+");
        return s.ToUpper() == s && anyLetters.Match(s).Success;
    }
}
