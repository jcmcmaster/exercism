module Raindrops

open System

let convert (number: int): string =
    let accumulator acc item = 
      if number % fst item = 0 then 
        acc + snd item
      else acc

    let divisorMap = [ 3, "Pling"; 5, "Plang"; 7, "Plong" ]

    let sounds = List.fold accumulator String.Empty divisorMap

    if sounds = String.Empty then
      string number
    else
      sounds
