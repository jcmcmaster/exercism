import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub fn is_armstrong_number(number: Int) -> Bool {
  let digits = to_digits(number)

  let armstrong_total =
    digits
    |> list.map(fn(n) { integer_power(n, list.length(digits)) })
    |> int.sum

  armstrong_total == number
}

fn to_digits(number) {
  number
  |> int.to_string
  |> string.to_graphemes
  |> list.map(int.parse)
  |> list.map(result.unwrap(_, 0))
}

fn integer_power(i, e) {
  case e {
    0 -> 1
    1 -> i
    _ -> i * integer_power(i, e - 1)
  }
}
