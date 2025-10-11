public static class PhoneNumber
{
  public static (bool IsNewYork, bool IsFake, string LocalNumber) Analyze(string phoneNumber)
  {
    var components = phoneNumber.Split('-');
    return (IsNewYork: components[0] == "212", IsFake: components[1] == "555", LocalNumber: components[2]);
  }

  public static bool IsFake((bool IsNewYork, bool IsFake, string LocalNumber) phoneNumberInfo)
  {
    return phoneNumberInfo.IsFake;
  }
}
