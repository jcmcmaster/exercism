module SqueakyClean

open System

let transform (c: char) : string =
    match c with
    | '-' -> "_"
    | c when System.Char.IsWhiteSpace c -> String.Empty
    | c when System.Char.IsDigit c -> String.Empty
    | c when System.Char.IsUpper c -> "-" + string (System.Char.ToLower c)
    | c when c >= 'α' && c <= 'ω' -> "?"
    | _ -> string c
 
let clean (identifier: string) : string =
    identifier
    |> Seq.map transform
    |> String.Concat
