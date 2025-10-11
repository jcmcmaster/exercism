module Raindrops

let convert (number: int) : string =
    [ 3, "Pling"; 5, "Plang"; 7, "Plong" ]
    |> List.choose (fun (i, s) -> if number % i = 0 then Some s else None)
    |> function
        | [] -> string number
        | strings -> String.concat "" strings

