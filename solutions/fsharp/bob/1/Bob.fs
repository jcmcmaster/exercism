module Bob

let response (input: string) : string =
    let isQuestion (input: string) = input.EndsWith '?'

    let isYelling (input: string) =
        Seq.exists System.Char.IsLetter input && input.ToUpper() = input

    match input.Trim() with
    | s when isQuestion s ->
        if isYelling s then
            "Calm down, I know what I'm doing!"
        else
            "Sure."
    | s when isYelling s -> "Whoa, chill out!"
    | "" -> "Fine. Be that way!"
    | _ -> "Whatever."
