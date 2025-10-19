import gleam/bool
import gleam/dict
import gleam/list
import gleam/string

pub fn is_isogram(phrase phrase: String) -> Bool {
  phrase
  |> string.lowercase
  |> string.to_graphemes
  |> list.filter(is_alpha)
  |> list.group(fn(x) { x })
  |> dict.values
  |> list.any(fn(l) { list.length(l) > 1 })
  |> bool.negate
}

fn is_alpha(s) {
  string.lowercase(s) != string.uppercase(s)
}
