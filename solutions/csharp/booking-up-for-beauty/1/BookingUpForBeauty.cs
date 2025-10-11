using System;

static class Appointment
{
  private static readonly DateTime OPENING = new DateTime(2012, 9, 15);

  public static DateTime Schedule(string appointmentDateDescription) =>
    DateTime.Parse(appointmentDateDescription);

  public static bool HasPassed(DateTime appointmentDate) =>
    appointmentDate < DateTime.Now;

  public static bool IsAfternoonAppointment(DateTime appointmentDate) =>
    appointmentDate.Hour >= 12 && appointmentDate.Hour < 18;

  public static string Description(DateTime appointmentDate) =>
    $"You have an appointment on {appointmentDate.ToString()}.";

  public static DateTime AnniversaryDate() =>
    OPENING.AddYears(DateTime.Now.Year - OPENING.Year);
}
