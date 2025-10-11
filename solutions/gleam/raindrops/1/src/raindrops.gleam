import gleam/int
import gleam/list
import gleam/string

pub fn convert(number: Int) -> String {
  let sounds =
    [#(3, "Pling"), #(5, "Plang"), #(7, "Plong")]
    |> list.fold("", fn(acc, mapping) {
      case number % mapping.0 {
        0 -> acc <> mapping.1
        _ -> acc
      }
    })

  case string.is_empty(sounds) {
    True -> int.to_string(number)
    False -> sounds
  }
}
