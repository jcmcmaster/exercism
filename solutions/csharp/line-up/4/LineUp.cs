public static class LineUp
{
    public static string Format(string name, int number)
    {
        string suffix = (number % 10) switch
        {
            1 when number % 100 != 11 => "st",
            2 when number % 100 != 12 => "nd",
            3 when number % 100 != 13 => "rd",
            _ => "th"
        };

        return $"{name}, you are the {number}{suffix} customer we serve today. Thank you!";
    }
}
