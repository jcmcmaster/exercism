import gleam/list
import gleam/string

pub fn egg_count(number: Int) -> Int {
  number
  |> to_binary_string_rec("")
  |> string.to_graphemes
  |> list.count(fn(g) { g == "1" })
}

fn to_binary_string_rec(number, acc) {
  let rem = number % 2
  case number {
    0 -> acc
    i if rem == 1 -> to_binary_string_rec(i / 2, acc <> "1")
    i -> to_binary_string_rec(i / 2, acc <> "0")
  }
}
