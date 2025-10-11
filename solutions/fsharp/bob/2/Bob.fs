module Bob

let response (input: string) : string =
    let (|Question|_|) (phrase: string) =
        if phrase.EndsWith '?' then Some() else None

    let (|Yell|_|) (phrase: string) =
        if Seq.exists System.Char.IsLetter phrase && phrase.ToUpper() = phrase then
            Some()
        else
            None

    let (|Silence|_|) (phrase: string) = if phrase = "" then Some() else None

    match input.Trim() with
    | Yell & Question -> "Calm down, I know what I'm doing!"
    | Yell -> "Whoa, chill out!"
    | Question -> "Sure."
    | Silence -> "Fine. Be that way!"
    | _ -> "Whatever."
