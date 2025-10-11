using System;
using System.Globalization;
using System.Runtime.InteropServices;

public enum Location
{
  NewYork,
  London,
  Paris
}

public enum AlertLevel
{
  Early,
  Standard,
  Late
}

public static class Appointment
{
  public static DateTime ShowLocalTime(DateTime dtUtc) =>
    dtUtc.ToLocalTime();

  public static DateTime Schedule(string appointmentDateDescription, Location location)
  {
    DateTime parsed = DateTime.Parse(appointmentDateDescription);
    TimeZoneInfo timezone;

    if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
    {
      timezone = TimeZoneInfo.FindSystemTimeZoneById(
          location switch
          {
            Location.NewYork => "Eastern Standard Time",
            Location.London => "GMT Standard Time",
            Location.Paris => "W. Europe Standard Time",
            _ => "Dunno",
          });
    }
    else
    {
      timezone = TimeZoneInfo.FindSystemTimeZoneById(
          location switch
          {
            Location.NewYork => "America/New_York",
            Location.London => "Europe/London",
            Location.Paris => "Europe/Paris",
            _ => "Dunno",
          });
    }

    return TimeZoneInfo.ConvertTimeToUtc(parsed, timezone);
  }

  public static DateTime GetAlertTime(DateTime appointment, AlertLevel alertLevel) =>
    alertLevel switch
    {
      AlertLevel.Early => appointment.AddDays(-1),
      AlertLevel.Standard => appointment.AddHours(-1).AddMinutes(-45),
      AlertLevel.Late => appointment.AddMinutes(-30),
      _ => appointment
    };

  public static bool HasDaylightSavingChanged(DateTime dt, Location location)
  {
    DateTime local = Schedule(dt.ToString(), location);
    DateTime thisYearsMarchTwelfth = new DateTime(local.Year, 3, 12);
    DateTime thisYearsNovemberFifth = new DateTime(local.Year, 11, 5);
    if (local - thisYearsMarchTwelfth < TimeSpan.FromDays(7))
      return true;
    if (local - thisYearsNovemberFifth < TimeSpan.FromDays(7))
      return true;
    return false;
  }

  public static DateTime NormalizeDateTime(string dtStr, Location location)
  {
    DateTime parsed = new DateTime(1, 1, 1);
    switch (location)
    {
      case Location.NewYork:
        DateTime.TryParse(dtStr, new CultureInfo("en-US"), out parsed);
        break;
      case Location.London:
        DateTime.TryParse(dtStr, new CultureInfo("en-GB"), out parsed);
        break;
      case Location.Paris:
        DateTime.TryParse(dtStr, new CultureInfo("fr-FR"), out parsed);
        break;
    }
    return parsed;
  }
}
