import gleam/int
import gleam/list
import gleam/result

pub fn is_armstrong_number(number: Int) -> Bool {
  let digits =
    int.digits(number, 10)
    |> result.unwrap([])

  let armstrong_total =
    digits
    |> list.map(integer_power(_, list.length(digits)))
    |> int.sum

  armstrong_total == number
}

fn integer_power(i, e) {
  case e {
    0 -> 1
    1 -> i
    _ -> i * integer_power(i, e - 1)
  }
}
