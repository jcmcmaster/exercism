public static class LineUp
{
    public static string Format(string name, int number)
    {
        string suffix = number.ToString() switch
        {
            "11" or "12" or "13" => "th",
            string n when n.EndsWith('1') => "st",
            string n when n.EndsWith('2') => "nd",
            string n when n.EndsWith('3') => "rd",
            _ => "th"
        };

        return $"{name}, you are the {number}{suffix} customer we serve today. Thank you!";
    }
}
