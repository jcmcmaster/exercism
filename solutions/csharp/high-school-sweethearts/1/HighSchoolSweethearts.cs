using System;
using System.Globalization;

public static class HighSchoolSweethearts
{
  public static string DisplaySingleLine(string studentA, string studentB)
  {
    var firstHalf = new string(' ', 30 - studentA.Length - 1) + studentA;
    var secondHalf = studentB + new string(' ', 30 - studentB.Length - 1);
    return $"{firstHalf} ♡ {secondHalf}";
  }

  public static string DisplayBanner(string studentA, string studentB)
  {
    return $@"
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     {studentA} +  {studentB}    **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *";
  }

  public static string DisplayGermanExchangeStudents(
      string studentA,
      string studentB,
      DateTime start,
      float hours)
  {
    CultureInfo german = new("de-DE");
    return $"{studentA} and {studentB} have been dating since {start:dd.MM.yyyy} - that's {hours.ToString("N2", german)} hours";
  }
}
