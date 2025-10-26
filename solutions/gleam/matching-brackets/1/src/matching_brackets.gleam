import gleam/bool
import gleam/string

pub fn is_paired(value: String) -> Bool {
  value
  |> string.to_graphemes
  |> recurse([])
}

fn recurse(chars, brackets) {
  use <- bool.guard(chars == [], case brackets {
    [] -> True
    _ -> False
  })

  let assert [current_char, ..rest_of_input] = chars

  case current_char {
    "[" | "{" | "(" -> recurse(rest_of_input, [current_char, ..brackets])
    "]" | "}" | ")" -> {
      use <- bool.guard(brackets == [], False)
      let assert [most_recent_bracket, ..rest_of_brackets] = brackets
      case does_close(most_recent_bracket, current_char) {
        False -> False
        True -> recurse(rest_of_input, rest_of_brackets)
      }
    }
    _ -> recurse(rest_of_input, brackets)
  }
}

fn does_close(b1, b2) {
  case b1, b2 {
    "{", "}" | "[", "]" | "(", ")" -> True
    _, _ -> False
  }
}
