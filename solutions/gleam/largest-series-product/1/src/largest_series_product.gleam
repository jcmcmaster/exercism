import gleam/bool
import gleam/int
import gleam/list
import gleam/result

pub fn largest_product(digits: String, span: Int) -> Result(Int, Nil) {
  use <- bool.guard(span == 0, Ok(1))
  use parsed <- result.try(int.parse(digits))
  use <- bool.guard(parsed == 0, Ok(0))

  let assert Ok(digits) = int.digits(parsed, 10)
  digits
  |> list.window(span)
  |> list.map(int.product)
  |> list.max(int.compare)
}
