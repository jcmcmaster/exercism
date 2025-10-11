import gleam/string

pub fn message(log_line: String) -> String {
  case log_line {
    "[INFO]: " <> rest | "[WARNING]: " <> rest | "[ERROR]: " <> rest -> rest
    _ -> ""
  }
  |> string.trim
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[INFO]" <> _ -> "info"
    "[WARNING]" <> _ -> "warning"
    "[ERROR]" <> _ -> "error"
    _ -> ""
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
