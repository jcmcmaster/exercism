public static class LogAnalysis
{
  public static string SubstringAfter(this string s, string startDelim) =>
    s[(s.IndexOf(startDelim) + startDelim.Length)..];

  public static string SubstringBetween(this string s, string startDelim, string endDelim) =>
    s[(s.IndexOf(startDelim) + startDelim.Length)..(s.IndexOf(endDelim))];

  public static string Message(this string s) =>
    s[(s.IndexOf(':') + 1)..].Trim();

  public static string LogLevel(this string s) =>
    s[1..s.IndexOf(']')];
}
