static class LogLine
{
  public static string Message(string logLine) =>
    logLine.Split(":", StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries)[1];

  public static string LogLevel(string logLine) =>
    logLine.Split(":", StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries)[0][1..^1].ToLower();

  public static string Reformat(string logLine) =>
    $"{Message(logLine)} ({LogLevel(logLine)})";
}
