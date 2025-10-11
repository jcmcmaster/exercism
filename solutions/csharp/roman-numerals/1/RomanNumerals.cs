using System.Collections.Generic;
using System.Linq;

public static class RomanNumeralExtension
{
    static Dictionary<int, string> DecimalToRoman = new() {
        { 1, "I" },
        { 4, "IV" },
        { 5, "V" },
        { 9, "IX" },
        { 10, "X" },
        { 40, "XL" },
        { 50, "L" },
        { 90, "XC" },
        { 100, "C" },
        { 400, "CD" },
        { 500, "D" },
        { 900, "CM" },
        { 1000, "M" },
    };

    public static string ToRoman(this int value)
    {
        string result = "";
        while (value > 0)
        {
            var greatestLesserNumeral = DecimalToRoman
                .Where(x => x.Key <= value)
                .MaxBy(x => x.Key);

            result += greatestLesserNumeral.Value.ToString();
            value -= greatestLesserNumeral.Key;
        }
        return result;
    }
}
