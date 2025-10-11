import gleam/int
import gleam/list

pub fn square_of_sum(n: Int) -> Int {
  list.range(1, n)
  |> int.sum
  |> fn(i) { i * i }
}

pub fn sum_of_squares(n: Int) -> Int {
  list.range(1, n)
  |> list.map(fn(i) { i * i })
  |> int.sum
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
