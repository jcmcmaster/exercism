import gleam/int
import gleam/list

pub fn convert(number: Int) -> String {
  let sounds =
    [#(3, "Pling"), #(5, "Plang"), #(7, "Plong")]
    |> list.fold("", fn(acc, mapping) {
      case number % mapping.0 {
        0 -> acc <> mapping.1
        _ -> acc
      }
    })

  case sounds {
    "" -> int.to_string(number)
    _ -> sounds
  }
}
