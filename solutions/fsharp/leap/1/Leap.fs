module Leap

let leapYear (year: int): bool =
    if year % 4 = 0
      then year % 100 <> 0 || year % 400 = 0 
    else false
