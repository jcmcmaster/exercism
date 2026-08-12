public static class LineUp
{
    public static string Format(string name, int number)
    {
        string suffix = number.ToString() switch
        {
            [.., '1', '1'] or [.., '1', '2'] or [.., '1', '3'] => "th",
            [.., '2'] => "nd",
            [.., '3'] => "rd",
            _ => "th"
        };

        return $"{name}, you are the {number}{suffix} customer we serve today. Thank you!";
    }
}
