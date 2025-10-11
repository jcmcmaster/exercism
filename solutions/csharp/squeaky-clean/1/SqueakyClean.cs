using System;
using System.Text;

public static class Identifier
{
  public static string Clean(string identifier)
  {
    StringBuilder builder = new();

    for (int i = 0; i < identifier.Length; i++)
    {
      string append;
      char cur = identifier[i];

      if (cur == ' ')
        append = "_";
      else if (cur == '\0')
        append = "CTRL";
      else if (cur == '-')
      {
        append = char.ToUpper(identifier[i + 1]).ToString();
        i++;
      }
      else if (!Char.IsLetter(cur))
        append = string.Empty;
      else if (cur >= 'α' && cur <= 'ω')
        append = string.Empty;
      else
        append = identifier[i].ToString();

      builder.Append(append);
    }

    return builder.ToString();
  }
}
