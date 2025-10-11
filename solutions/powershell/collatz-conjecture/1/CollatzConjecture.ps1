Function Invoke-CollatzConjecture()
{
  <#
    .SYNOPSIS
    Calculate the number of steps to reach 1 using the Collatz conjecture.

    .DESCRIPTION
    Take any positive integer n. If n is even, divide n by 2 to get n / 2. If n is odd, multiply n by 3 and add 1 to get 3n + 1. Repeat the process indefinitely. The conjecture states that no matter which number you start with, you will always reach 1 eventually.

    .PARAMETER Number
    The number to perform the Collatz Conjecture function on.

    .EXAMPLE
    Invoke-CollatzConjecture -Number 12
    #>
  [CmdletBinding()]
  Param(
    [Int64]$Number
  )

  Function Recurse
  {
    [CmdletBinding()]
    Param(
      [Int64] $Value,
      [Int32] $Count
    )

    if ($Value -le 0)
    {
      throw "error: Only positive numbers are allowed"
    }

    if ($Value -le 1)
    {
      return $Count
    }

    if ($Value % 2 -eq 0)
    {
      return Recurse -Value ($Value / 2) -Count ($Count + 1)
    }

    return Recurse -Value ($Value * 3 + 1) -Count ($Count + 1)
  }

  return Recurse -Value $Number -Count 0
}
