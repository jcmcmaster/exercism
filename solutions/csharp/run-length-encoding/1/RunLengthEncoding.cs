using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

public static class RunLengthEncoding
{
    public static string Encode(string input)
    {
        if (input?.Length == 0) return string.Empty;

        char prev = input[0];
        int count = 1;
        string result = string.Empty;

        for (int i = 1; i <= input.Length; i++)
        {
            if (i < input.Length && input[i] == prev)
            {
                count++;
            }
            else
            {
                result += $"{(count > 1 ? count : "")}{prev}";
                if (i != input.Length) prev = input[i];
                count = 1;
            }
        }

        return result;
    }

    public static string Decode(string input)
    {
        string result = string.Empty;
        List<char> digits = new();

        for (int i = 0; i < input.Length; i++)
        {
            if (Char.IsDigit(input[i]))
            {
                digits.Add(input[i]);
                while (i + digits.Count < input.Length && Char.IsDigit(input[i + digits.Count]))
                {
                    digits.Add(input[i + digits.Count]);
                }
                i += digits.Count - 1;
            }
            else
            {
                int runLength = digits.Count == 0 ? 1 : int.Parse(new string(digits.ToArray()));
                result += new string(input[i], runLength);
                digits.Clear();
            }
        }

        return result;
    }
}
