public static class Triangle
{
    private static bool ValidEdges(double a, double b, double c) =>
        a + b > c
        && b + c > a
        && a + c > b;

    public static bool IsScalene(double a, double b, double c) =>
        ValidEdges(a, b, c) && a != b && b != c && a != c;

    public static bool IsIsosceles(double a, double b, double c) =>
        ValidEdges(a, b, c) && !IsScalene(a, b, c);

    public static bool IsEquilateral(double a, double b, double c) =>
        ValidEdges(a, b, c) && a == b && b == c;
}
