import gleam/string

pub fn reverse(value: String) -> String {
  value
  |> string.to_graphemes
  |> reverse_rec([])
  |> string.concat
}

fn reverse_rec(value, acc) {
  case value {
    [] -> acc
    [head, ..tail] -> reverse_rec(tail, [head, ..acc])
  }
}
