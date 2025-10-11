public class SpaceAge
{
    private double _years;

    public SpaceAge(int seconds)
    {
        _years = seconds / (60 * 60 * 24 * 365.25);
    }

    public double OnMercury() => _years / 0.2408467;

    public double OnVenus() => _years / 0.61519726;

    public double OnEarth() => _years;

    public double OnMars() => _years / 1.8808158;

    public double OnJupiter() => _years / 11.862615;

    public double OnSaturn() => _years / 29.447498;

    public double OnUranus() => _years / 84.016846;

    public double OnNeptune() => _years / 164.79132;
}
