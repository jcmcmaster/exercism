import gleam/string

pub fn is_paired(value: String) -> Bool {
  value
  |> string.to_graphemes
  |> recurse([])
}

fn recurse(chars, brackets) {
  case chars, brackets {
    [], [] -> True
    [], _ -> False
    ["[" as open, ..tail], _
    | ["{" as open, ..tail], _
    | ["(" as open, ..tail], _
    -> recurse(tail, [open, ..brackets])
    ["]", ..chars_tail], ["[", ..brackets_tail]
    | ["}", ..chars_tail], ["{", ..brackets_tail]
    | [")", ..chars_tail], ["(", ..brackets_tail]
    -> recurse(chars_tail, brackets_tail)
    ["]", ..], _ | ["}", ..], _ | [")", ..], _ -> False
    [_, ..tail], _ -> recurse(tail, brackets)
  }
}
