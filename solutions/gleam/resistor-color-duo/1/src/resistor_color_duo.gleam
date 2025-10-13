import gleam/int
import gleam/list

pub type Color {
  Black
  Brown
  Red
  Orange
  Yellow
  Green
  Blue
  Violet
  Grey
  White
}

fn to_int(color) {
  case color {
    Black -> 0
    Brown -> 1
    Red -> 2
    Orange -> 3
    Yellow -> 4
    Green -> 5
    Blue -> 6
    Violet -> 7
    Grey -> 8
    White -> 9
  }
}

pub fn value(colors: List(Color)) -> Result(Int, Nil) {
  case list.length(colors) < 2 {
    False -> {
      colors
      |> list.take(2)
      |> list.map(to_int)
      |> list.index_map(fn(val, idx) { val * integer_power(10, 1 - idx) })
      |> int.sum
      |> Ok
    }
    _ -> Error(Nil)
  }
}

fn integer_power(i, e) {
  case e {
    0 -> 1
    1 -> i
    _ -> i * integer_power(i, e - 1)
  }
}
