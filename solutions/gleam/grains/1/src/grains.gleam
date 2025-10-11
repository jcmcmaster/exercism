import gleam/result

pub type Error {
  InvalidSquare
}

pub fn square(square: Int) -> Result(Int, Error) {
  case square {
    s if s < 1 || s > 64 -> Error(InvalidSquare)
    _ -> integer_power(2, square - 1) |> Ok
  }
}

pub fn total() -> Int {
  do_total(0, 64)
}

fn integer_power(i, e) {
  case e {
    0 -> 1
    1 -> i
    _ -> i * integer_power(i, e - 1)
  }
}

fn do_total(acc, s) {
  case s <= 0 {
    True -> acc
    False -> {
      let square_squared =
        square(s)
        |> result.unwrap(0)
      do_total(square_squared + acc, s - 1)
    }
  }
}
