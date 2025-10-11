import gleam/string

fn is_question(s) {
  string.ends_with(s, "?")
}

fn is_yell(s) {
  string.lowercase(s) != s && string.uppercase(s) == s
}

fn is_silence(s) {
  string.is_empty(s)
}

pub fn hey(remark: String) -> String {
  let trimmed = remark |> string.trim
  case is_question(trimmed), is_yell(trimmed), is_silence(trimmed) {
    True, True, _ -> "Calm down, I know what I'm doing!"
    True, _, _ -> "Sure."
    _, True, _ -> "Whoa, chill out!"
    _, _, True -> "Fine. Be that way!"
    _, _, _ -> "Whatever."
  }
}
