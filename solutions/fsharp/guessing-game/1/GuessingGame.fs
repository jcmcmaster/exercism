module GuessingGame

let reply (guess: int) : string =
    let actual = 42

    match guess with
    | g when g = actual -> "Correct"
    | g when g < actual - 1 -> "Too low"
    | g when g > actual + 1 -> "Too high"
    | _ -> "So close"
