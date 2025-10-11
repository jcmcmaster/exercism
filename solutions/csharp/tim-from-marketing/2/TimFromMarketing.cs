static class Badge
{
  public static string Print(int? id, string name, string? department)
  {
    string departmentOrOwner = department != null ? department.ToUpper() : "OWNER";
    string nameAndDepartment = $"{name} - {departmentOrOwner}";
    return id == null ? nameAndDepartment : $"[{id}] - {nameAndDepartment}";
  }
}
