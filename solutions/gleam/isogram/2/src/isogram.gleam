import gleam/list
import gleam/string

pub fn is_isogram(phrase phrase: String) -> Bool {
  phrase
  |> string.lowercase
  |> string.to_graphemes
  |> list.filter(is_alpha)
  |> fn(graphemes) { graphemes == list.unique(graphemes) }
}

fn is_alpha(s) {
  string.lowercase(s) != string.uppercase(s)
}
