import gleam/list

pub fn square_of_sum(n: Int) -> Int {
  let sum =
    list.range(1, n)
    |> list.reduce(fn(acc, n) { acc + n })
  case sum {
    Ok(s) -> s * s
    _ -> 0
  }
}

pub fn sum_of_squares(n: Int) -> Int {
  list.range(1, n)
  |> list.map(fn(n) { n * n })
  |> list.reduce(fn(acc, n) { acc + n })
  |> fn(r) {
    case r {
      Ok(s) -> s
      _ -> 0
    }
  }
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
