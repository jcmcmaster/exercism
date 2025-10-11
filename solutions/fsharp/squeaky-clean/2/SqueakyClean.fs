module SqueakyClean

open System

let transform (c: char) : string =
    let isGreek c = c >= 'α' && c <= 'ω'
    let upperToCamel c = "-" + string (System.Char.ToLower c)
    let isNotAllowed c = System.Char.IsDigit c || System.Char.IsWhiteSpace c

    match c with
    | '-' -> "_"
    | c when isNotAllowed c -> String.Empty
    | c when System.Char.IsUpper c -> upperToCamel c
    | c when isGreek c -> "?"
    | _ -> string c

let clean (identifier: string) : string =
    identifier |> Seq.map transform |> String.Concat
