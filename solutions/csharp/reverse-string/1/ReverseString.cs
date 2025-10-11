using System;
using System.Linq;

public static class ReverseString
{
    public static string Reverse(string input)
    {
        var arr = input.ToArray();
        for (int i = 0; i < arr.Length / 2; i++)
        {
            var swap = arr[i];
            arr[i] = arr[^(i + 1)];
            arr[^(i + 1)] = swap;
        }
        return new String(arr);
    }
}
