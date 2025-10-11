using System;

static class Badge
{
  public static string Print(int? id, string name, string? department)
  {
    string nameAndDepartment = $"{name} - {(department != null ? department.ToUpper() : "OWNER")}";
    return id == null ? nameAndDepartment : $"[{id}] - {nameAndDepartment}";
  }
}
