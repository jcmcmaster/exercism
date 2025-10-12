import gleam/list
import gleam/regexp
import gleam/string

pub fn is_pangram(sentence: String) -> Bool {
  let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

  sentence
  |> string.uppercase
  |> string.to_graphemes
  |> list.sort(string.compare)
  |> list.fold("", fn(acc, g) {
    let assert Ok(is_alpha_regexp) = regexp.from_string("[A-Z]")
    let is_alpha = regexp.check(is_alpha_regexp, g)
    let already_there = string.contains(acc, g)
    case is_alpha, already_there {
      True, False -> acc <> g
      _, _ -> acc
    }
  })
  == alphabet
}
