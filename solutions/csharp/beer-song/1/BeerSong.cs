using System;

public static class BeerSong
{
    private const string VERSE_TEMPLATE =
        "{0} bottle{1} of beer on the wall, {2} bottle{1} of beer.\n{3}, {4} bottle{5} of beer on the wall.";

    public static string Recite(int startBottles, int takeDown)
    {
        string result = string.Empty;
        for (int i = startBottles; i >= startBottles + 1 - takeDown; i--)
        {
            result += i switch
            {
                > 2 => string.Format(VERSE_TEMPLATE, i, "s", i, "Take one down and pass it around", i - 1, "s"),
                2 => string.Format(VERSE_TEMPLATE, 2, "s", 2, "Take one down and pass it around", 1, ""),
                1 => string.Format(VERSE_TEMPLATE, 1, "", 1, "Take it down and pass it around", "no more", "s"),
                0 => string.Format(VERSE_TEMPLATE, "No more", "s", "no more", "Go to the store and buy some more", 99, "s"),
                _ => throw new Exception()
            };

            if (i > startBottles + 1 - takeDown) result += "\n\n";
        }
        return result;
    }
}
