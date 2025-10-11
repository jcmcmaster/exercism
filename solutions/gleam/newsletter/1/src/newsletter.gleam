import gleam/list
import gleam/result
import gleam/string
import simplifile

fn not_empty(s) {
  !string.is_empty(s)
}

pub fn read_emails(path: String) -> Result(List(String), Nil) {
  simplifile.read(path)
  |> result.map(string.split(_, "\n"))
  |> result.map(list.filter(_, not_empty))
  |> result.map(list.map(_, string.trim))
  |> result.replace_error(Nil)
}

pub fn create_log_file(path: String) -> Result(Nil, Nil) {
  simplifile.create_file(path)
  |> result.replace_error(Nil)
}

pub fn log_sent_email(path: String, email: String) -> Result(Nil, Nil) {
  simplifile.append(to: path, contents: email <> "\n")
  |> result.replace_error(Nil)
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {
  use _ <- result.try(create_log_file(log_path))
  use addresses <- result.try(read_emails(emails_path))
  list.each(addresses, fn(address) {
    case send_email(address) {
      Ok(_) -> {
        let _ = log_sent_email(log_path, address)
        Nil
      }
      _ -> Nil
    }
  })
  Ok(Nil)
}
