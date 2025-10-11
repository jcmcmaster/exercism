static class LogLine
{
  public static string Message(string logLine)
  {
    return logLine.Trim().Substring(logLine.IndexOf(':') + 2).Trim();
  }

  public static string LogLevel(string logLine)
  {
    return logLine.Trim().Substring(1, logLine.IndexOf(']') - 1)?.ToLower();
  }

  public static string Reformat(string logLine)
  {
    string message = Message(logLine);
    string logLevel = LogLevel(logLine);
    return $"{message} ({logLevel})";
  }
}
