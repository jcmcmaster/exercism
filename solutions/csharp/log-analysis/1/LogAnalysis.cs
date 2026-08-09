public static class LogAnalysis
{
  public static string SubstringAfter(this string source, string delimiter) =>
    source[(source.IndexOf(delimiter) + delimiter.Length)..^0];

  public static string SubstringBetween(this string source, string start, string end) =>
    source[(source.IndexOf(start) + start.Length)..source.IndexOf(end)];

  public static string Message(this string source) =>
    source.SubstringAfter(": ");

  public static string LogLevel(this string source) =>
    source.SubstringBetween("[", "]");
}
