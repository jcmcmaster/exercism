import gleam/regexp
import gleam/string

fn is_question(s) {
  string.ends_with(s, "?")
}

fn is_yell(s) {
  let regexp_options = regexp.Options(False, False)
  let assert Ok(has_upper) = regexp.compile("[A-Z]", regexp_options)
  let assert Ok(has_lower) = regexp.compile("[a-z]", regexp_options)
  regexp.check(has_upper, s) && !regexp.check(has_lower, s)
}

fn is_silence(s) {
  string.is_empty(s)
}

pub fn hey(remark: String) -> String {
  let trimmed = remark |> string.trim
  let is_question = trimmed |> is_question
  let is_yell = trimmed |> is_yell
  let is_silence = trimmed |> is_silence
  case is_question, is_yell, is_silence {
    True, True, _ -> "Calm down, I know what I'm doing!"
    True, _, _ -> "Sure."
    _, True, _ -> "Whoa, chill out!"
    _, _, True -> "Fine. Be that way!"
    _, _, _ -> "Whatever."
  }
}
