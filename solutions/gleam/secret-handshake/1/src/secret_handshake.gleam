import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub type Command {
  Wink
  DoubleBlink
  CloseYourEyes
  Jump
}

pub fn commands(encoded_message: Int) -> List(Command) {
  encoded_message
  |> int.digits(2)
  |> result.unwrap([])
  |> list.map(int.to_string)
  |> string.join("")
  |> string.pad_start(5, "0")
  |> string.to_graphemes
  |> list.reverse
  |> list.index_fold([], fn(acc, cur, idx) {
    case cur, idx {
      "0", _ -> acc
      "1", 0 -> [Wink, ..acc]
      "1", 1 -> [DoubleBlink, ..acc]
      "1", 2 -> [CloseYourEyes, ..acc]
      "1", 3 -> [Jump, ..acc]
      "1", 4 -> list.reverse(acc)
      _, _ -> acc
    }
  })
  |> list.reverse
}
